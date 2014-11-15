require 'rails_helper'

RSpec.describe Uber, :type => :class do

  describe 'get_time_estimate' do

    let(:start_lat){37.775818}
    let(:start_lon){-122.418028}

    context 'given valid latitude and longitude starting coordinates' do

      it 'retrieves time estimate for uber X only' do
        VCR.use_cassette('get_time_estimate') do
          uber = Uber.new
          uber_x_time_arrival = uber.get_time_estimate(start_lat, start_lon)
          expect(uber_x_time_arrival).to be_kind_of(Fixnum)
        end
      end

      it 'returns "-" (blank) when it cannot return time estimate' do
        VCR.use_cassette('get_time_estimate_FAIL') do
          uber = Uber.new
          uber_x_time_arrival = uber.get_time_estimate(nil, nil)
          expect(uber_x_time_arrival).to eq '-'
        end
      end
    end
  end

  describe 'get_price_estimate' do

    let(:start_lat){37.775818}
    let(:start_lon){-122.418028}
    let(:end_lat){37.802139}
    let(:end_lon){-122.41874}

    context 'given valid latitude and longitude starting && ending coordinates' do

      it 'retrieves price estimate for uber X only' do
        VCR.use_cassette('get_price_estimate') do
          uber = Uber.new
          uber_price_hash = uber.get_uber_trip(start_lat, start_lon, end_lat, end_lon)
          expect(uber_price_hash[:uber_low_price]).to be_kind_of(String)
          expect(uber_price_hash[:uber_hi_price]).to be_kind_of(String)
          expect(uber_price_hash[:surge_multiplier]).to be_kind_of(Float)
        end
      end

      it 'returns "-" (blank) when it cannot return price estimate' do
        VCR.use_cassette('get_price_estimate_FAIL') do
          uber = Uber.new
          uber_price_hash = uber.get_uber_trip(start_lat, start_lon, nil, nil)
          expect(uber_price_hash).to eq '-'
          # expect(uber_price_hash[:uber_hi_price]).to eq '-'
        end
      end
    end
  end


end
