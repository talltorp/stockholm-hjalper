class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donation_amount
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
