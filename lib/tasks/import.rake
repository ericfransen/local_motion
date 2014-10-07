require 'csv'

desc "Import Denver B-Cycle station locations from CSV file"
task :import => [:environment] do

  file = "db/b_cycle_stations.csv"

  CSV.foreach(file, :headers => true) do |row|
    BCycleStations.create({
      :station_name => row[0],
      :num_docks => row[3],
      :address_line1 => row[6],
      :city => row[8],
      :state => row[9],
      :zip => row[10]
    })
  end

end

# STATION_NAME,STATION_ADDRESS,PROPERTY_TYPE,NUM_DOCKS,POWER_TYPE,ADDRESS_ID,ADDRESS_LINE1,ADDRESS_LINE2,CITY,STATE,ZIP,STATUS
