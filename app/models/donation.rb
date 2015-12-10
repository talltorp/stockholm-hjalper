class Donation < ActiveRecord::Base
  validates_presence_of :name, :phone, :email, :donation_amount

  belongs_to :campaign
end
