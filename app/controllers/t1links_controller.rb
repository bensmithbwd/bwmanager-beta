class T1linksController < ApplicationController
  load_and_authorize_resource

  def index
    @q = T1link.search(params[:q])
    @t1links = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    redirect_to t1links_path
  end

  def new
    @t1link = T1link.new
  end

  def edit
    @t1link = T1link.find(params[:id])
  end

  def create
    @t1link = T1link.new(params[:t1link])
    if @t1link.save
      redirect_to @t1link, notice: "T1links [#{@t1link.id}] was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @t1link = T1link.find(params[:id])
    if @t1link.update_attributes(params[:t1link])
      redirect_to @t1link, notice: "T1links [#{@t1link.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @t1link = T1link.find(params[:id])
    @t1link.destroy
    redirect_to t1links_path
  end
end
