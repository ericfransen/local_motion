class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def create
    @starting_location    = params[:starting_location]
    @destination_location = params[:destination_address]
    
    binding.pry
    @trip = Trip.create(starting_location_id: starting_location,
                        destination_location_id: destination_location,
                       )

    if @trip.save
      redirect_to index
    else
      render :new, notice: "Destination invalid."
    end
  end
end
