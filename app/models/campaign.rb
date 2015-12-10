class Campaign < ActiveRecord::Base
  has_many :donations

  before_validation :set_to_completed_if_fully_funded

  def total_donation_amount
    donations.sum(:donation_amount)
  end

  private

  def set_to_completed_if_fully_funded
    if total_donation_amount == funding_goal
      self.fully_funded = true
    end
  end
end
