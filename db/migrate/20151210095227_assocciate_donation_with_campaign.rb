class AssocciateDonationWithCampaign < ActiveRecord::Migration
  def change
    add_reference :donations, :campaign, index: true
    add_foreign_key :donations, :campaigns
  end
end
