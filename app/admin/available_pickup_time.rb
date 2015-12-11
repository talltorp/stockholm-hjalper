ActiveAdmin.register AvailablePickupTime do
  permit_params :day, :time_span, :campaign_id
end
