class CreateBCycleStations < ActiveRecord::Migration
  def change
    create_table :b_cycle_stations do |t|
      t.string :station_name
      t.float  :num_docks
      t.string :address_line1
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
