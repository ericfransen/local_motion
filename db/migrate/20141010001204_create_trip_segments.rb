class CreateTripSegments < ActiveRecord::Migration
  def change
    create_table :trip_segments do |t|
      t.references :trip, index: true

      t.timestamps
    end
  end
end
