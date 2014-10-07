require 'csv'

desc "Import Denver B-Cycle station locations from CSV file"
task :import => [:environment] do

  file = "db/b_cycle_stations.csv"

  CSV.foreach(file, :headers => true) do |row|
    BCycleStations.create({
      :station_name => row[1],
      :num_docks => row[4],
      :address_line1 => row[7],
      :city => row[9],
      :state => row[10],
      :zip => row[11]
    })
  end

end

# STATION_NAME,STATION_ADDRESS,PROPERTY_TYPE,NUM_DOCKS,POWER_TYPE,ADDRESS_ID,ADDRESS_LINE1,ADDRESS_LINE2,CITY,STATE,ZIP,STATUS
