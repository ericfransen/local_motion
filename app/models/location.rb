class Location < ActiveRecord::Base
  # belongs_to :trip_segment

  geocoded_by :address
  after_validation :geocode

  # validates :latitude, :longitude, presence: true

  def self.update_lat_longs
    self.where(latitude: nil).each(&:save)
  end

end
