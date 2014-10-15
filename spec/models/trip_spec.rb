require 'rails_helper'

RSpec.describe Trip, :type => :model do

  it 'is associated with a trip' do
      my_trip = Trip.create
      my_trip_seg = TripSegment.create(trip_id: my_trip.id)

      expect(my_trip.trip_segments.count).to eq 1
      expect(my_trip.trip_segments).to include(my_trip_seg)
  end

end
