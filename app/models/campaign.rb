class Campaign < ActiveRecord::Base
  has_many :donations
  has_many :drop_off_locations
  has_many :available_pickup_times

  before_validation :set_to_completed_if_fully_funded

  def self.currently_active
    where(expired: false, fully_funded: false)
  end

  def self.closed_campaigns
    where("expired = ? OR fully_funded = ?", true, true)
  end

  def total_donation_amount
    Donation.where(campaign_id: self.id, accepted: true).sum(:donation_amount)
  end

  private

  def set_to_completed_if_fully_funded
    if total_donation_amount >= funding_goal
      self.fully_funded = true
    end
  end
end
