require 'rails_helper'

RSpec.describe Uber, :type => :class do

  describe 'get_time_estimates' do

    let(:lat){37.775818}
    let(:lon){-122.418028}

    context 'given valid latitude and longitude coordinates' do

      it 'retrieves time estimate for uber X only' do
        VCR.use_cassette('get_time_estimates') do
          uber = Uber.new
          uber_x_time_arrival = uber.get_time_estimates(lat, lon)
          expect(uber_x_time_arrival).to be_kind_of(Fixnum)
        end
      end
    end
    
  end


end
