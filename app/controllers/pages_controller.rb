class PagesController < ApplicationController
  before_action :require_login, except: [:home, :about]

  def home
  end

  def about
  end

  def account
  end

  def index
    @st_lat    = current_user.trips.last.starting_location.latitude
    @uber_time = Uber.new.get_time_estimate(current_user.trips.last.starting_location.latitude,
                                            current_user.trips.last.destination_location.longitude)

    @uber_price = Uber.new.get_price_estimate(current_user.trips.last.starting_location.latitude,
                                              current_user.trips.last.starting_location.longitude,
                                              current_user.trips.last.destination_location.latitude,
                                              current_user.trips.last.destination_location.longitude)
  end

private

   def require_login
     unless current_user
       flash[:error] = "You must log in with UBER to build a trip"
       redirect_to root_path
     end
   end
end
