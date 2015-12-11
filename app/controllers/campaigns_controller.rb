class CampaignsController < ApplicationController
  def index
    @active_campaigns = Campaign.currently_active
    @expired_campaigns = Campaign.closed_campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @donation = Donation.new
  end
end
