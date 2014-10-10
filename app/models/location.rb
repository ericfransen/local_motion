class Location < ActiveRecord::Base
  belongs_to :trip_segment, foreign_key: trip_segment_id
end
