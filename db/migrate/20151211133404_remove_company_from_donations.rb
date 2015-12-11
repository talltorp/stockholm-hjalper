class RemoveCompanyFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :company
  end
end
