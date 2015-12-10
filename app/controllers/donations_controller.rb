class DonationsController < ApplicationController
  def create
    donation = Donation.new(donation_params)
    campaign = Campaign.find(params[:campaign_id])
    campaign.donations << donation

    if campaign.save
      flash[:notice] = I18n.t("donations.create.flash_successful_donation")
      redirect_to campaign_path(campaign)
    else
      flash[:error] = donation.errors.full_messages.to_sentence
      redirect_to campaign_path(campaign)
    end
  end

  private

  def campaign_from_params
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
