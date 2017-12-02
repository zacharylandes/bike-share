require 'pry'
class Trip < ActiveRecord::Base

  belongs_to :station, foreign_key: "start_station_id", class_name: "Station"
  # belongs_to :end_station, foreign_key: "end_station_id", class_name: "Station"

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :start_station_id,
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

  def self.station_with_most_rides_at_start
      # max = group(:start_station_id).count.max_by{|id,count| count}.first
      # station = Station.find_by(:id => max)
      # station.name
      # max.max_by{|id,count| count}
    # binding.pry

  end
end
