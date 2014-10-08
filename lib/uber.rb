class Uber

  def get_time_estimates(lat, lon)
    times = Rest.get(url: time_estimate_url, options: time_estimate_options(lat, lon))
    uber_x_times = times['times'].select{|service| service['display_name'] == "uberX"}[0]
    uber_x_times['estimate']
  end

private

  def time_estimate_url
    base_url + '/time'
  end

  def time_estimate_options(lat, lon)
    {
      server_token: server_token,
      start_latitude: lat,
      start_longitude: lon
    }
  end

  def base_url
    'https://api.uber.com/v1/estimates'
  end

  def server_token
    ENV['uber_server_token']
  end

end
