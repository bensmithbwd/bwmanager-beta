class TransactionsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Transaction.search(params[:q])
    @transactions = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
    
    @credit = Transaction.select("SUM(credit) as total").first
    @debit = Transaction.select("SUM(debit) as total").where("ttype != 'D'").first
    @dividends = Transaction.select("SUM(debit) as total").where("ttype = 'D'").first
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
      
      Transaction.create(:date => row[0], :description => row[4], :debit => row[5], :credit => row[6], :balance => row[7], :ttype => transaction_type)
    end
    redirect_to transactions_path
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
