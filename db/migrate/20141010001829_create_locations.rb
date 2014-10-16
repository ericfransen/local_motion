class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :trip_segment, index: true

      t.timestamps
    end
  end
end
