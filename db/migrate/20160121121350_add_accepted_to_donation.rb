class AddAcceptedToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :accepted, :boolean, null: false, default: false
  end
end
