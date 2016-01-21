require "rails_helper"

RSpec.describe CampaignMailer, :type => :mailer do
  describe "#notify_pm_of_donation" do
    it "sends the email to the project manager" do
      campaign = create(:campaign, funding_goal: 10)
      donation = create(:donation, donation_amount: 2)
      campaign.donations << donation

      mail = CampaignMailer.notify_pm_of_donation(donation)

      expect(mail.to[0]).to eql(campaign.contact_email)
    end

    it "includes information about the donation" do
      campaign = create(:campaign, funding_goal: 10)
      donation = create(:donation, {
        donation_amount: 2,
        name: "Good person",
        phone: "0707111222",
        email: "goodperson@example.com",
        message: "this is the message",
        requested_pickup_time: "Monday 12-17"
      })
      campaign.donations << donation

      mail = CampaignMailer.notify_pm_of_donation(donation)

      expect(mail.body).to match("#{ donation.donation_amount }")
      expect(mail.body).to match(donation.name)
      expect(mail.body).to match(donation.phone)
      expect(mail.body).to match(donation.email)
      expect(mail.body).to match(donation.message)
      expect(mail.body).to match(donation.requested_pickup_time)
      expect(mail.body).to match("#{donation_url(donation)}/confirm/#{donation.confirmation_code}")
    end
  end

  describe "#send_thank_you_to_donor" do
    it "sends the email to the project manager" do
      campaign = create(:campaign, funding_goal: 10)
      donation = create(:donation, donation_amount: 2)
      campaign.donations << donation

      mail = CampaignMailer.send_thank_you_to_donor(donation)

      expect(mail.to[0]).to eql(donation.email)
    end

    it "includes information about the donation" do
      campaign = create(:campaign, funding_goal: 10)
      donation = create(:donation, {
        donation_amount: 2,
        name: "Good person",
        phone: "0707111222",
        email: "goodperson@example.com",
        message: "this is the message",
      })
      campaign.donations << donation

      mail = CampaignMailer.send_thank_you_to_donor(donation)

      expect(mail.body).to match("#{ donation.donation_amount }")
      expect(mail.body).to match(donation.campaign.title)
    end
  end
end
