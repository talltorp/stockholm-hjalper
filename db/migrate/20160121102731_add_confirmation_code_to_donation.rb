class AddConfirmationCodeToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :confirmation_code, :string
  end
end
