class RemoveTripSegmentTable < ActiveRecord::Migration
  def change
    drop_table :trip_segments
  end
end
