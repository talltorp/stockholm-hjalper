class DonationsController < ApplicationController
  def create
    @donation = build_donation_from_params
    @campaign = Campaign.find(params[:campaign_id])
    @campaign.donations << @donation

    if add_donation_to_campaign(@donation, @campaign)
      flash[:notice] = I18n.t("donations.create.flash_successful_donation")
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @donation.errors.full_messages.to_sentence
      render "campaigns/show"
    end
  end

  def confirm
    @donation = Donation.find(params["id"])
    confirmation_code = params["confirmation_code"]
    confirm_donation = ConfirmDonation.new(donation: @donation)

    confirm_donation.confirm_with(confirmation_code)
  end

  private

  def build_donation_from_params
    donation = Donation.new(donation_params)

    if params[:requested_pickup_time].present?
      pickup_time = AvailablePickupTime.find(params[:requested_pickup_time])
      donation.requested_pickup_time = pickup_time.pickup_as_string
    end

    donation
  end

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
          :organisation,
        )
  end
end
