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
  end

  def self.years
    distinct.pluck('extract(year from start_date)')
  end

  def self.find_month_names(month)
    Date::MONTHNAMES[month]
  end

  def self.trips_per_month
    years.map do |year|
      found = where('extract(year from start_date)= ?', year).group('extract(month from start_date)').order("count_id DESC").count(:id)
      months = Hash[found.map{|month,count|[month.to_i,count]}]
      month_names = Hash[months.map{|month,count|[find_month_names(month),count]}]
      {year => month_names }
    end
  end

  def self.sum_trips_per_year
    result = years.map do |year|
     found = where('extract(year from start_date)= ?', year).group('extract(month from start_date)').order("count_id DESC").count(:id)
    end
    result = result.map {|result| result.values.sum}
    years.zip(result)
  end

  def self.most_ridden_bike
    group(:bike_id).order("count_id DESC").count(:id).first
  end

  def self.least_ridden_bike
    group(:bike_id).order("count_id ASC").count(:id).first
  end


  def self.percentage_of_subscriber_type
    amount = subscription_type_breakout.values
    total = amount.sum
    amount.map do |num|
      ((num/total.to_f)*100).round(1)
    end
  end

  def self.subscription_type_breakout
     group(:subscription_type).order("count_id DESC").count(:id)
    # binding.pry
  end
end
