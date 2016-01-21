require 'rails_helper'

RSpec.describe Donation, :type => :model do
  describe "when creating a new donation" do
    it "creates a unique confirmation code for it" do
      donation = create(:donation)

      expect(donation.confirmation_code).to be_a String
    end
  end
end
