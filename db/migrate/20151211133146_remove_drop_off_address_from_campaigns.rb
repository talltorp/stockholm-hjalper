class RemoveDropOffAddressFromCampaigns < ActiveRecord::Migration
  def change
    remove_column :campaigns, :drop_off_address
  end
end
