class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @trip_segment = @trip.trip_segments.build
  end

  def create
    @starting_location = params[:starting_location]
    @destination_location = params[:destination_address]

    @trip = Trip.create
    # @trip.trip_segments.create(starting_location: starting_location)
    TripSegment.create(starting_location: starting_location,
                       destination_location: destination_location,
                       trip_id: @trip.id)

    if trip.save
      redirect_to index
    else
      render :new, notice: "Destination invalid."
    end
  end
end
