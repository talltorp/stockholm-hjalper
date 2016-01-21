class AddOrganisationToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :organisation, :string
  end
end
