require 'rails_helper'

RSpec.describe Campaign, :type => :model do
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
