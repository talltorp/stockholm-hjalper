require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  describe "when donations match the funding goal" do
    it "sets the campaign as completed" do
      campaign = create(:campaign, funding_goal: 4)
      campaign.donations << create(:donation, donation_amount: 2)
      campaign.save

      campaign.donations << create(:donation, donation_amount: 2)
      campaign.save

      expect(campaign.fully_funded?).to be true
    end
  end

  describe "when donations do not match the funding goal" do
    it "keeps the campaign open" do
      campaign = create(:campaign, funding_goal: 4)
      campaign.donations << create(:donation, donation_amount: 2)
      campaign.save

      campaign.donations << create(:donation, donation_amount: 1)
      campaign.save

      expect(campaign.fully_funded?).to be false
    end
  end

  describe ".currently_active" do
    it "fetches campaigns that are not fully funded and have not exired" do
      create(:campaign, expired: true, fully_funded: false)
      create(:campaign, expired: false, fully_funded: false)
      create(:campaign, expired: false, fully_funded: true)
      create(:campaign, expired: false, fully_funded: false)

      active_campaigns = Campaign.currently_active

      expect(active_campaigns.length).to be 2
    end
  end

  describe "#total_donation_amount" do
    context "with no donations" do
      it "defaults to 0" do
        campaign = build(:campaign, funding_goal: 10)

        total_donation_amount = campaign.total_donation_amount

        expect(total_donation_amount).to eql(0)
      end
    end

    context "with three donations which makes up less than the maximum amount" do
      it "summarizes the donations" do
        campaign = create(:campaign, funding_goal: 10)
        campaign.donations << create(:donation, donation_amount: 2)
        campaign.donations << create(:donation, donation_amount: 3)
        campaign.donations << create(:donation, donation_amount: 1)
        campaign.save

        total_donation_amount = campaign.total_donation_amount

        expect(total_donation_amount).to eql(6)
      end
    end

    context "with donations which equal the maximum amount" do
      it "summarizes the donations" do
        campaign = create(:campaign, funding_goal: 10)
        campaign.donations << create(:donation, donation_amount: 2)
        campaign.donations << create(:donation, donation_amount: 3)
        campaign.donations << create(:donation, donation_amount: 1)
        campaign.donations << create(:donation, donation_amount: 4)
        campaign.save

        total_donation_amount = campaign.total_donation_amount

        expect(total_donation_amount).to eql(10)
      end
    end
  end
end
