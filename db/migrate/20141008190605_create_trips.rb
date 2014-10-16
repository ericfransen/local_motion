class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :starting_street
      t.string :starting_city
      t.string :starting_state
      t.string :starting_zip
      t.string :destination_street
      t.string :destination_city
      t.string :destination_state
      t.string :destination_zip

      t.timestamps
    end
  end
end
