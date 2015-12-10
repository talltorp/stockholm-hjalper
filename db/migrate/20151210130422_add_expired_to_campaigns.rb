class AddExpiredToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :expired, :boolean
  end
end
