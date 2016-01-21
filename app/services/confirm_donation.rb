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
    donation.save
  end
end
