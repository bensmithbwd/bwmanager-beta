class CampaignsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Campaign.search(params[:q])
    @campaigns = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    redirect_to campaigns_path
  end
  
  def new
    @campaign = Campaign.new    
    @campaign_dates = Campaign.ttype_dates + Campaign.links_index_dates
  end

  def edit
    @campaign = Campaign.find(params[:id])
    @campaign_dates = Campaign.ttype_dates + Campaign.links_index_dates
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    if @campaign.save
      redirect_to campaigns_path, notice: "Campaign [#{@campaign.id}] was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      redirect_to campaigns_path, notice: "Campaign [#{@campaign.id}] was successfully updated."
    else
      render action: "edit"
    end
  end

  def duplicate
    campaign_to_duplicate = Campaign.find(params[:id])
    new_campaign = campaign_to_duplicate.dup
    new_campaign.save
    redirect_to campaigns_path, notice: "Campaign [#{campaign_to_duplicate.id}] was successfully duplicated to Campaign [#{new_campaign.id}]."
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy    
    redirect_to campaigns_path
  end
end
