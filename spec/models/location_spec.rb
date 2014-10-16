require 'rails_helper'

RSpec.describe Location, :type => :model do

  let(:starting_location) { Location.new(address: "1510 Blake St Denver Colorado 80202") }
  let(:destination_location) { Location.new(address: "2551 W 34th Ave Denver CO") }

  describe 'location' do
    it 'can geocode and save a location from address' do
      VCR.use_cassette('get_location_lat_longs') do
        # starting_location = Location.new
        # starting_location.address = '1510 Blake St Denver Colorado 80202'
        starting_location.save
        expect(starting_location.latitude).to be_kind_of(Float)
        expect(starting_location.longitude).to be_kind_of(Float)
      end
    end

    it 'is associated with a trip segment' do
      VCR.use_cassette('get_two_locations_lats_longs') do
        starting_location.save
        destination_location.save
        my_trip = Trip.new(starting_location_id: starting_location.id,
                           destination_location_id: destination_location.id
                          )

        expect(my_trip.starting_location.latitude).to eq 39.7496354
        expect(my_trip.starting_location.longitude).to eq -105.0001058
        expect(my_trip.destination_location.latitude).to eq 39.764665
        expect(my_trip.destination_location.longitude).to eq -105.018681
      end
    end




  end

end
