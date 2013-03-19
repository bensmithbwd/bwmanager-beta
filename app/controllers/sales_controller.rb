class SalesController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Sale.search(params[:q])
    @sales = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def create
    @sale = Sale.new(params[:sale])
    if @sale.save
      redirect_to @sale, notice: "Sale [#{@sale.id}] was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update_attributes(params[:sale])
      redirect_to @sale, notice: "Sale [#{@sale.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_path
  end
end
