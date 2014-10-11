class Location < ActiveRecord::Base
  belongs_to :trip_segment
end
