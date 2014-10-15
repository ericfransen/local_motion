class Trip < ActiveRecord::Base
  belongs_to :starting_location,    class_name: "Location"
  belongs_to :destination_location, class_name: "Location"

  belongs_to :user
end
