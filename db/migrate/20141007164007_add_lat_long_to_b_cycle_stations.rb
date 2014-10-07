class AddLatLongToBCycleStations < ActiveRecord::Migration
  def change
    add_column :b_cycle_stations, :latitude, :float
    add_column :b_cycle_stations, :longitude, :float
  end
end
