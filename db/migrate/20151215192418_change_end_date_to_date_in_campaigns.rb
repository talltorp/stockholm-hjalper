class ChangeEndDateToDateInCampaigns < ActiveRecord::Migration
  def change
    change_column :campaigns, :end_date, :date
  end
end
