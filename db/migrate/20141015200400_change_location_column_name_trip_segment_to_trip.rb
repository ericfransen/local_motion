class ChangeLocationColumnNameTripSegmentToTrip < ActiveRecord::Migration
  def change
    rename_column :locations, :trip_segment_id, :trip_id
  end
end
