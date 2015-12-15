class ChangePreambleToIngressOnCampaigns < ActiveRecord::Migration
  def change
    rename_column :campaigns, :preamble, :ingress
  end
end
