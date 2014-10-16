class PagesController < ApplicationController
  def home
  end

  def about
  end

  def account
  end

  def index
    @st_lat = current_user.trips.last.starting_location.latitude
    @uber_time = Uber.new.get_time_estimate(current_user.trips.last.starting_location.latitude,
                                            current_user.trips.last.destination_location.longitude)

    @uber_price = Uber.new.get_price_estimate(current_user.trips.last.starting_location.latitude,
                                              current_user.trips.last.starting_location.longitude,
                                              current_user.trips.last.destination_location.latitude,
                                              current_user.trips.last.destination_location.longitude)
  end
end
