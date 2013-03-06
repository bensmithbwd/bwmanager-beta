class UrlsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Url.search(params[:q])
    @urls = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    redirect_to urls_path
  end
  
  def new
    @url = Url.new    
  end

  def edit
    @url = Url.find(params[:id])
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      respond_to do |format|
        format.html { redirect_to urls_path, notice: "Url [#{@url.id}] was successfully created." }
        format.js
      end
    else
      render action: "new"
    end
  end

  def update
    @url = Url.find(params[:id])
    if @url.update_attributes(params[:url])
      redirect_to urls_path, notice: "Url [#{@url.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end
end
