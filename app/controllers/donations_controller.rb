class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.donations << @donation

    if add_donation_to_campaign(@donation, @campaign)
      flash[:notice] = I18n.t("donations.create.flash_successful_donation")
      #redirect_to campaign_path(@campaign)
    else
      flash[:error] = @donation.errors.full_messages.to_sentence
      render "campaigns/show"
      #redirect_to campaign_path(campaign)
    end
  end

  private

  def add_donation_to_campaign(donation, campaign)
    AddDonationToCampaign.new(donation: donation, campaign: campaign).call
  end

  def donation_params
    params.
      require(:donation).
      permit(:name,
          :phone,
          :email,
          :message,
          :donation_amount,
        )
  end
end
