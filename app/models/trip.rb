class Trip < ActiveRecord::Base

  belongs_to :station

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id,
                        :subscription_type

  def self.average_trip_length
    # binding.pry
    average(:duration).to_i
  end

  def self.longest_ride
    maximum(:duration).to_i
  end

  def self.shortest_ride
    minimum(:duration).to_i
  end

  # def self.station_with_most_rides_at_start
  #
  # end
end
