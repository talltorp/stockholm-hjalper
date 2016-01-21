class AddAmountBeforePickupToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :amount_before_pickup, :integer
  end
end
