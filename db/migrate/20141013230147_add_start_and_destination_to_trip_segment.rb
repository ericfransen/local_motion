class AddStartAndDestinationToTripSegment < ActiveRecord::Migration
  def change
    change_table :trip_segments do |t|
      t.references :starting_location
      t.references :destination_location
    end
  end
end
