class AddEndDateToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :end_date, :datetime
  end
end
