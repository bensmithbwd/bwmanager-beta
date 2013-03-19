class SaleLinesController < ApplicationController
  load_and_authorize_resource
  
  # GET /sale_lines
  # GET /sale_lines.json
  def index
    @sale_lines = SaleLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_lines }
    end
  end

  # GET /sale_lines/1
  # GET /sale_lines/1.json
  def show
    @sale_line = SaleLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale_line }
    end
  end

  # GET /sale_lines/new
  # GET /sale_lines/new.json
  def new
    @sale_line = SaleLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale_line }
    end
  end

  # GET /sale_lines/1/edit
  def edit
    @sale_line = SaleLine.find(params[:id])
  end

  # POST /sale_lines
  # POST /sale_lines.json
  def create
    @sale_line = SaleLine.new(params[:sale_line])

    respond_to do |format|
      if @sale_line.save
        format.html { redirect_to @sale_line, notice: 'Sale line was successfully created.' }
        format.json { render json: @sale_line, status: :created, location: @sale_line }
      else
        format.html { render action: "new" }
        format.json { render json: @sale_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sale_lines/1
  # PUT /sale_lines/1.json
  def update
    @sale_line = SaleLine.find(params[:id])

    respond_to do |format|
      if @sale_line.update_attributes(params[:sale_line])
        format.html { redirect_to @sale_line, notice: 'Sale line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_lines/1
  # DELETE /sale_lines/1.json
  def destroy
    @sale_line = SaleLine.find(params[:id])
    @sale_line.destroy

    respond_to do |format|
      format.html { redirect_to sale_lines_url }
      format.json { head :no_content }
    end
  end
end
