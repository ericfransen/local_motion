require 'rails_helper'

RSpec.describe Trip, :type => :model do

  it 'is associated with a location' do
    starting_location = Location.create
    destination_location = Location.create
    my_trip = Trip.create(starting_location: starting_location,
                          destination_location: destination_location)

    expect(my_trip.starting_location).to eq(starting_location)
  end

  it 'is associated with a user' do
    user = User.create
    trip = Trip.create(user: user)

    expect(user.trips).to include(trip)
    expect(user.trips.count).to eq 1
  end

end
