class CreateAvailablePickupTimes < ActiveRecord::Migration
  def change
    create_table :available_pickup_times do |t|
      t.string :day
      t.string :time_span
      t.belongs_to :campaign
    end
  end
end
