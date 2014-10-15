class AddLocationsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :starting_location_id, :integer
    add_column :trips, :destination_location_id, :integer
  end
end
