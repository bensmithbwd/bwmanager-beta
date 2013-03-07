class ClientsController < ApplicationController
  load_and_authorize_resource

  def index
    @q = Client.search(params[:q])
    @clients = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @client = Client.find(params[:id])
    @campaigns = Campaign.find(@client.campaign_ids)
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      respond_to do |format|
        format.html { redirect_to clients_path, notice: "#{@client.name} (#{@client.company}) was successfully created." }
        format.js
      end
    else
      render action: "new"
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      redirect_to clients_path, notice: "#{@client.name} (#{@client.company}) was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path
  end
end
