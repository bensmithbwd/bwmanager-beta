class SaleLinesController < ApplicationController
  load_and_authorize_resource
  
  def edit
    @sale_line = SaleLine.find(params[:id])
  end

  def create
    @sale = Sale.find(params[:sale_id])
    @sale_line = @sale.sale_lines.create(params[:sale_line])
    redirect_to @sale, notice: "SaleLine [#{@sale_line.id}] was successfully added to Sale [#{@sale.id}]."
  end

  def update
    @sale = Sale.find(params[:sale_id])
    if @sale.update_attributes(params[:sale])
      redirect_to @sale, notice: "Sale [#{@sale.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @sale_line = SaleLine.find(params[:id])
    @sale_line.destroy
    redirect_to sales_path
  end
end
