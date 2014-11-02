class BCycleStation < ActiveRecord::Base

  geocoded_by :full_street_address
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  def address_changed?
    address_parts = ['address_line1', 'city', 'state', 'zip']
    address_parts.any?{|a| send "#{a}_changed?"}
  end

  # private

  def full_street_address
    "#{address_line1} #{city} #{state} #{zip}"
  end
end
