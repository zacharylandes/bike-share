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
      max = group(:start_station_id).order("count_id DESC").count(:id).first[0]
      Station.find(max).name
  end

  def self.station_with_most_rides_at_end
      max = group(:end_station_id).order("count_id DESC").count(:id).first[0]
      Station.find(max).name
      # station.name
  end

  def self.trips_per_month
    years = distinct.pluck('extract(year from start_date)')
    years.map do |year|
      # binding.pry
      {
        year => where('extract(year from start_date)= ?', year).group('extract(month from start_date)').order("count_id DESC").count(:id)

      }
    end
  end
end
