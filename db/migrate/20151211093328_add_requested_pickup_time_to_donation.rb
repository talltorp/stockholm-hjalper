class AddRequestedPickupTimeToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :requested_pickup_time, :string
  end
end
