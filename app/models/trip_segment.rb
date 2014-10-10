class TripSegment < ActiveRecord::Base
  has_one :starting_location,    class_name: "Location"
  has_one :destination_location, class_name: "Location"
  
  belongs_to :trip
end
