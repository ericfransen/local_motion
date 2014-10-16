require 'rails_helper'

RSpec.describe BCycleStation, :type => :model do

  describe 'bcycle station' do
    it 'can geocode a location' do
      VCR.use_cassette('get_bcycle_lat_longs') do
        station = BCycleStation.new do |s|
          s.address_line1 = '1510 Blake St'
          s.city          = 'Denver'
          s.state         = 'CO'
          s.zip           = '80202'
        end
        station.save
        expect(station.latitude).to be_kind_of(Float)
        expect(station.longitude).to be_kind_of(Float)
      end
    end
  end
end
