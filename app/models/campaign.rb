class Campaign < ActiveRecord::Base
  has_many :donations

  def total_donation_amount
    donations.sum(:donation_amount)
  end
end
