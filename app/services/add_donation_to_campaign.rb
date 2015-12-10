class AddDonationToCampaign
  attr_accessor :campaign, :donation

  def initialize(options={})
    @campaign = options.fetch(:campaign)
    @donation = options.fetch(:donation)
  end

  def call
    campaign.donations << donation

    if campaign.save
      CampaignMailer.notify_pm_of_donation(donation).deliver_later
      CampaignMailer.send_thank_you_to_donor(donation).deliver_later
      true
    else
      false
    end
  end
end
