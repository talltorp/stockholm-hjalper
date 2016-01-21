ActiveAdmin.register Donation do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :donation_amount, :name, :phone, :email, :message,
              :requested_pickup_time, :accepted, :organisation,
              :campaign_id, :confirmation_code
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
