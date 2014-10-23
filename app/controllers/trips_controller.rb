class TripsController < ApplicationController

  before_action :require_login

  def new
    @trip = Trip.new
  end

  def create
    start_location = Location.create(latitude: params[:starting_location][:latitude],
                                     longitude: params[:starting_location][:longitude])

    dest_location  = Location.create(address: params[:destination_location][:address])

    trip = Trip.create(starting_location:    start_location,
                       destination_location: dest_location,
                       user:                 current_user)
    if trip.save
      redirect_to '/index'
    else
      render :new, notice: "Destination invalid."
    end
  end

private

  def require_login
    unless current_user
      flash[:error] = "You must log in with UBER to build a trip"
      redirect_to root_path
    end
  end

end
