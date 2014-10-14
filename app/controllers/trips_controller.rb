class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @trip_segment = @trip.trip_segments.build
  end

  def create
    binding.pry
    start_address = params[:start_address]
    end_address = params[:destination_address]
    # starting_location = lat, long= Geocode address to get the lat and long
    # starting_location = Location.create(lat: some_variable.lat, ...)
    # ending_location = Location.create(lat: some_variable.lat, ...)


    @trip = Trip.create()
    # @trip.trip_segments.create(starting_location: starting_location)
    TripSegment.create(starting_location: starting_location, trip: @trip)

    if trip.save
      redirect_to index, notice: "Trip created."
    else
      render :new, notice: "Trip not created."
    end
  end
end
