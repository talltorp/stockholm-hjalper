require "rails_helper"

describe ConfirmDonation do
  describe "#confirm_with" do
    include ActiveJob::TestHelper

    after do
      clear_enqueued_jobs
    end

    context "with a valid confirmation code" do
      it "sets the 'accepted' flag to true" do
        donation = create(:donation)
        confirm_donation = ConfirmDonation.new(donation: donation)

        confirm_donation.confirm_with(donation.confirmation_code)
        donation.reload

        expect(donation.accepted).to be true
      end

      it "sends an email to the donors email address" do
        donation = create(:donation)
        confirm_donation = ConfirmDonation.new(donation: donation)

        confirm_donation.confirm_with(donation.confirmation_code)
        donor_email_job = enqueued_jobs.first[:args]

        expect(donor_email_job[0]).to eql("CampaignMailer")
        expect(donor_email_job[1]).to eql("send_thank_you_to_donor")
        expect(donor_email_job[2]).to eql("deliver_now")

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
