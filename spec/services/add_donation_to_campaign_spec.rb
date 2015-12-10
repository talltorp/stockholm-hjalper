require "rails_helper"

describe AddDonationToCampaign do
  describe "#call" do
    include ActiveJob::TestHelper

    after do
      clear_enqueued_jobs
    end

    it "adds the donation to the campaign" do
      campaign = create_campaign_with_one_donation
      donation = build(:donation, donation_amount: 1)
      add_donation_to_campaign = AddDonationToCampaign.new(campaign: campaign, donation: donation)

      add_donation_to_campaign.call

      expect(campaign.donations.length).to be 2
    end

    it "returns the save status of the campaign" do
      campaign = create_campaign_with_one_donation
      donation = build(:donation, donation_amount: 1)
      add_donation_to_campaign = AddDonationToCampaign.new(campaign: campaign, donation: donation)

      expect(add_donation_to_campaign.call).to be true
    end

    it "sends an email to the project manager for the charity" do
      campaign = create_campaign_with_one_donation
      donation = build(:donation, donation_amount: 1)
      add_donation_to_campaign = AddDonationToCampaign.new(campaign: campaign, donation: donation)

      add_donation_to_campaign.call
      pm_email_job = enqueued_jobs.first[:args]

      expect(pm_email_job[0]).to eql("CampaignMailer")
      expect(pm_email_job[1]).to eql("notify_pm_of_donation")
      expect(pm_email_job[2]).to eql("deliver_now")
    end

    it "sends an email to the donors email address" do
      campaign = create_campaign_with_one_donation
      donation = build(:donation, donation_amount: 1, email: "joe@example.com")
      add_donation_to_campaign = AddDonationToCampaign.new(campaign: campaign, donation: donation)

      add_donation_to_campaign.call
      donor_email_job = enqueued_jobs.second[:args]

      expect(donor_email_job[0]).to eql("CampaignMailer")
      expect(donor_email_job[1]).to eql("send_thank_you_to_donor")
      expect(donor_email_job[2]).to eql("deliver_now")

    end

    def create_campaign_with_one_donation
      campaign = create(:campaign, funding_goal: 10)
      campaign.donations << create(:donation, donation_amount: 2)
      campaign.save

      campaign
    end
  end
end
