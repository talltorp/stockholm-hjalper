class CreateDropOffLocation < ActiveRecord::Migration
  def change
    create_table :drop_off_locations do |t|
      t.string :name
      t.string :address
      t.text :opening_hours
      t.belongs_to :campaign, index: true
    end
  end
end
