class AvailablePickupTime < ActiveRecord::Base
  belongs_to :campaign

  def pickup_as_string
    "#{day} #{time_span}"
  end
end
