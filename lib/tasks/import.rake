require 'csv'

desc "Import Denver B-Cycle station locations from CSV file"
task :import_bcycle => [:environment] do

  puts "Getting B-Cycle locations from website..."

  b_cycle_station_locations = HTTParty.get("http://data.denvergov.org/download/gis/b_cycle_stations/csv/b_cycle_stations.csv")

  puts "Done."
  puts "Saving to file..."

  File.open('./tmp/b_cycle_station_locations.csv', 'w') do |f|
    f.write b_cycle_station_locations.body
  end

  puts "Done."
  puts "Storing locations into database..."

  CSV.foreach('./tmp/b_cycle_station_locations.csv', :headers => true) do |row|
    BCycleStation.create({
      :station_name => row[0],
      :num_docks => row[3],
      :address_line1 => row[6],
      :city => row[8],
      :state => row[9],
      :zip => row[10]
    })
  end

  puts "Done."

end

# run with $rake import_bcycle

# STATION_NAME,
# STATION_ADDRESS,
# PROPERTY_TYPE,
# NUM_DOCKS,
# POWER_TYPE,
# ADDRESS_ID,
# ADDRESS_LINE1,
# ADDRESS_LINE2,
# CITY,
# STATE,
# ZIP,
# STATUS
