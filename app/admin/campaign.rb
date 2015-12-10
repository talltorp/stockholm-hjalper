ActiveAdmin.register Campaign do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :funding_goal, :fully_funded, :title,
  :contact_person, :contact_phone, :contact_email,
  :body_text, :preamble, :expired, :end_date, :drop_off_address
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
