class AddPublishedToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :published, :boolean
  end
end
