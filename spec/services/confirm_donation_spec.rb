require "rails_helper"

describe ConfirmDonation do
  describe "#confirm_with" do
    context "with a valid confirmation code" do
      it "sets the 'accepted' flag to true" do
        donation = create(:donation)
        confirm_donation = ConfirmDonation.new(donation: donation)

        confirm_donation.confirm_with(donation.confirmation_code)
        donation.reload

        expect(donation.accepted).to be true
      end
    end

    context "when confirmation code and donation id do not match" do
      it "sets the 'accepted' flag to true" do
        donation = create(:donation)
        confirm_donation = ConfirmDonation.new(donation: donation)

        confirm_donation.confirm_with("invalid")
        donation.reload

        expect(donation.accepted).to be false
      end
    end
  end
end
