class Car2go

  def self.fetch_cars
    vehicle_locations = Rest.get(url: vehicle_locations_url, options: car_options)
    placemarks = vehicle_locations["placemarks"]
    $redis.del("car2go_list")
    placemarks.each do |placemark|
      $redis.rpush('car2go_list', ActiveSupport::JSON.encode(placemark))
    end

# {"placemarks"=>
#   [{"address"=>"E Arkansas Ave 2325, 80210 Denver",
#     "coordinates"=>[-104.95991, 39.69117, 0],
#     "engineType"=>"CE",
#     "exterior"=>"GOOD",
#     "fuel"=>87,
#     "interior"=>"GOOD",
#     "name"=>"549XFI",
#     "vin"=>"WMEEJ3BA3DK629824"},

  end

  def self.get_cars
    placemarks = $redis.lrange('car2go_list', 0, $redis.llen('car2go_list'))
    placemarks.map do |placemark|
      ActiveSupport::JSON.decode(placemark)
    end
  end

  private

  def self.vehicle_locations_url
    'https://www.car2go.com/api/v2.1/vehicles?loc=denver&format=json'
  end

  def self.car_options
    {
      # loc: denver,
      oauth_consumer_key: consumer_key
      # format: json
    }
  end

  def self.consumer_key
    ENV['car2go_consumer_key']
  end

end
