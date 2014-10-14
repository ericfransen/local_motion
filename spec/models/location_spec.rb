require 'rails_helper'

RSpec.describe Location, :type => :model do

  describe 'location' do
    it 'can geocode a location from address' do
      VCR.use_cassette('get_location_lat_longs') do
        starting_location = Location.new
        starting_location.address = '1510 Blake St Denver Colorado 80202'
        starting_location.save
        expect(starting_location.latitude).to be_kind_of(Float)
        expect(starting_location.longitude).to be_kind_of(Float)
      end
    end
  end
end
