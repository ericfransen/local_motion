class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    start_location = Location.create(latitude:  params[:starting_location][:latitude],
                                     longitude: params[:starting_location][:longitude])

    dest_location  = Location.create( address:  params[:destination_location][:address])

    trip = Trip.create(starting_location: start_location,
                        destination_location: dest_location)
                        # user: current_user)

    if trip.save
      redirect_to '/index'
    else
      render :new, notice: "Destination invalid."
    end
  end
end
