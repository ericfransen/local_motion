require 'rails_helper'

RSpec.describe Car2go, :type => :class do

  describe 'get_cars' do

    it 'retrieves car2go API payload' do
      VCR.use_cassette('get_cars') do
        car_array = Car2go.get_cars
        expect(car_array).to be_kind_of(Array)
        expect(car_array.count).to be > 300
      end
    end
  end
end
