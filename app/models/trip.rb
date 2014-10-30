class Trip < ActiveRecord::Base
  belongs_to :starting_location,    class_name: "Location"
  belongs_to :destination_location, class_name: "Location"

  belongs_to :user

  # validates :starting_location_id, :destination_location_id, presence: true


    # def self.start_lat
    #   self.starting_location.latitude
    # end


  end
