require "securerandom"

class Donation < ActiveRecord::Base
  validates_presence_of :name, :phone, :email, :donation_amount
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  belongs_to :campaign

  before_validation :create_confirmation_code, on: :create

  private

  def create_confirmation_code
    self.confirmation_code = SecureRandom.hex
  end
end
