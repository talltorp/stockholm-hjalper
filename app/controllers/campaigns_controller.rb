class CampaignsController < ApplicationController
  def index
    @active_campaigns = Campaign.currently_active
    @expired_campaigns = Campaign.closed_campaigns

    set_default_metatags
  end

  def show
    @campaign = Campaign.find(params[:id])
    @donation = Donation.new

    set_show_metatags
  end

  private

  def set_show_metatags
    set_meta_tags og: {
			title:        @campaign.title,
			description:  @campaign.ingress,
			url:          campaign_url(@campaign),
			image:        og_image_url
		}
  end
end
