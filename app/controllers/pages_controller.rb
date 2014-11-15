class PagesController < ApplicationController
  before_action :require_login, except: [:home, :about]

  def home
  end

  def about
  end

  def account
  end

  def index
    @dest_add     = current_user.trips.last.destination_location.address
    @dest_add_lat = current_user.trips.last.destination_location.latitude
    @dest_add_lon = current_user.trips.last.destination_location.longitude

    @uber_time = Uber.new.get_time_estimate(current_user.trips.last.starting_location.latitude,
                                            current_user.trips.last.destination_location.longitude)
    @uber_trip = Uber.new.get_uber_trip(current_user.trips.last.starting_location.latitude,
                                        current_user.trips.last.starting_location.longitude,
                                        current_user.trips.last.destination_location.latitude,
                                        current_user.trips.last.destination_location.longitude)
    if @uber_trip != '-'
      @uber_price = "#{@uber_trip[:uber_low_price]} - #{@uber_trip[:uber_hi_price]}"
      @uber_ride_time = @uber_trip[:uber_trip_time] / 60
      @uber_total_time = @uber_time + @uber_ride_time
      @uber_surge = @uber_trip[:surge_multiplier]
    else
      @uber_price = '-'
      @uber_ride_time = '-'
      @uber_total_time = '-'
      @uber_surge = 0
    end



    @car2go = Car2go.get_cars
    @b_cycle_stations = BCycleStation.all
  end

private

  def require_login
    unless current_user
      flash[:error] = "You must log in with UBER to build a trip"
      redirect_to root_path
    end
  end
end
