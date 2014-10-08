class BCycleStation < ActiveRecord::Base

  geocoded_by :full_street_address
  after_validation :geocode

  def self.update_lat_longs
    self.where(latitude: nil).each(&:save)
  end


  private

  def full_street_address
    "#{address_line1} #{city} #{state} #{zip}"
  end


end
