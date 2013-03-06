class KeyphrasesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Keyphrase.search(params[:q])
    @keyphrases = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    redirect_to keyphrases_path
  end
  
  def new
    @keyphrase = Keyphrase.new
  end

  def edit
    @keyphrase = Keyphrase.find(params[:id])
  end

  def create
    @keyphrase = Keyphrase.new(params[:keyphrase])
    if @keyphrase.save
      respond_to do |format|
        format.html { redirect_to keyphrases_path, notice: "Keyphrase [#{@keyphrase.id}] was successfully created." }
        format.js
      end
    else
      render action: "new"
    end
  end

  def update
    @keyphrase = Keyphrase.find(params[:id])
    if @keyphrase.update_attributes(params[:keyphrase])
      redirect_to keyphrases_path, notice: "Keyphrase [#{@keyphrase.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @keyphrase = Keyphrase.find(params[:id])
    @keyphrase.destroy
    redirect_to keyphrases_path
  end
end
