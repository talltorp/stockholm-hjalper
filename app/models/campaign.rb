class Campaign < ActiveRecord::Base
  has_many :donations

  before_validation :set_to_completed_if_fully_funded

  def self.currently_active
    where(expired: false, fully_funded: false)
  end

  def self.closed_campaigns
    where("expired = ? OR fully_funded = ?", true, true)
  end

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
