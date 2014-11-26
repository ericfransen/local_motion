class Uber

  def get_time_estimate(start_lat, start_lon)
    times = Rest.get(url: time_estimate_url, options: time_estimate_options(start_lat, start_lon))
    if times['times']
      uber_x_time = times['times'].select{|service| service['display_name'] == "uberX"}[0]
      uber_x_time['estimate'] / 60
    else
      '-'
    end
  end

  def get_uber_trip(start_lat, start_lon, end_lat, end_lon)
    prices = Rest.get(url: price_estimate_url, options: price_estimate_options(start_lat, start_lon, end_lat, end_lon))
    if prices['prices']
      uber_x_price = prices['prices'].select {|service| service['localized_display_name'] == 'uberX'}[0]
      uber_trip = { :uber_low_price   => uber_x_price['low_estimate'],
                    :uber_hi_price    => uber_x_price['high_estimate'],
                    :surge_multiplier => uber_x_price['surge_multiplier'],
                    :uber_trip_time   => uber_x_price['duration'],
                    :uber_distance    => uber_x_price['distance']
                  }
    else
      '-'
    end
    # return "#{uber_price_hash[:uber_low_price]} - #{uber_price_hash[:uber_hi_price]}"
  end

  # def get_uber_price
  #   @uber_price = "#{@uber_trip[:uber_low_price]} - #{@uber_trip[:uber_hi_price]}"
  # end

private

  def time_estimate_url
    base_url + '/time'
  end

  def price_estimate_url
    base_url + '/price'
  end

  def time_estimate_options(start_lat, start_lon)
    {
      server_token: server_token,
      start_latitude: start_lat,
      start_longitude: start_lon
    }
  end

  def price_estimate_options(start_lat, start_lon, end_lat, end_lon)
    {
      server_token: server_token,
      start_latitude: start_lat,
      start_longitude: start_lon,
      end_latitude: end_lat,
      end_longitude: end_lon
    }
  end

  def base_url
    'https://api.uber.com/v1/estimates'
  end

  def server_token
    ENV['uber_server_token']
  end

end
