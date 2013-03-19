class TransactionsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Transaction.search(params[:q])
    @transactions = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end
  
  def upload
    require 'csv'
    
    CSV.parse(params[:file].read, :headers => true, :col_sep => ",") do |row|      
      # reset transaction type for each row
      transaction_type = ""
      
      # check for wages and attempt to split up wages and dividends
      if row[4].include?("BENWAGE") || row[4].include?("NICKWAGE") || row[4].include?("TOM SMITH")
        if row[5] == "600.00" then transaction_type = "W" else transaction_type = "D" end
      end
      
      # we'll now check for some costs
      if row[4].include?("HOSTGATOR") || row[4].include?("1&1")
        transaction_type = "C"
      end
      
      Transaction.create(:date => row[0], :description => row[4], :debit => row[5], :credit => row[6], :balance => row[7], :ttype => transaction_type)
    end
    
    redirect_to transactions_path
  end
  
  def accounts_report
    y = "#{params[:y]}-11-01"
    z = "#{params[:z]}-10-31"
    
    @accounts = Transaction.range(y, z)
    
    @sales_turnover = @accounts.credit_total
    @cost_of_sales = @accounts.by_type('C').debit_total
    @gross_profit = @sales_turnover - @cost_of_sales
    @directors_wages = @accounts.by_type('W').debit_total
    
    # work out dividends early so we can establish 'other expenses'
    @dividends = @accounts.by_type('D').debit_total
    
    @other_expenses = @accounts.debit_total - (@cost_of_sales + @directors_wages + @dividends)
    @admin_expenses = (@other_expenses + @directors_wages)
    @operating_profit = @gross_profit - @admin_expenses
    @corp_tax = @operating_profit * 0.2
    @profit_after_tax = @operating_profit - @corp_tax
    @retained_profit = @profit_after_tax - @dividends
  end
  
  def show
    redirect_to transactions_path
  end
  
  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      respond_to do |format|
        format.html { redirect_to transactions_path, notice: "Transaction [#{@transaction.id}] was successfully created." }
        format.js
      end
    else
      render action: "new"
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to transactions_path, notice: "Transaction [#{@transaction.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path
  end
end
