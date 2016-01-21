class ConfirmDonation
  attr_accessor :donation

  def initialize(options={})
    @donation = options.fetch(:donation)
  end

  def confirm_with(confirmation_code)
    if (donation.confirmation_code != confirmation_code)
      return
    end

    donation.accepted = true
    if donation.save
      update_funding_total_in_campaign
      CampaignMailer.send_thank_you_to_donor(donation).deliver_later
    end
  end

  private

  def update_funding_total_in_campaign
    donation.campaign.save
  end
end
