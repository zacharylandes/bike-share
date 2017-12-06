require 'pry'
class Trip < ActiveRecord::Base

  belongs_to :station, foreign_key: "start_station_id", class_name: "Station"

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
    select("trips.*, count(trips.id) AS count_all_trips")
      .joins(:station)
      .group(:start_station_id,:id)
      .order("count_all_trips DESC").first
  end

  def self.station_with_most_rides_at_end
    select("trips.*, count(trips.id) AS count_all_trips")
      .joins(:station)
      .group(:end_station_id, :id)
      .order("count_all_trips DESC").first
  end

  def stations
    Station.find(params[:id])
  end

  def self.number_of_rides_started_at_this_station(id)
    where(start_station_id: id).count
  end

  def self.number_of_rides_ended_at_this_station(id)
    where(end_station_id: id).count
  end

  def self.years
    distinct.pluck('extract(year from start_date)')
  end

  # def self.find_month_names(month)
  #   Date::MONTHNAMES[month]
  # end

  def self.trips_per_month_by_year(years)
    where('extract(year from start_date)= ?', years)
      .group('extract(year from start_date)')
      .group('extract(month from start_date)')
      .order("count_id DESC").count(:id)
  end

  def self.sum_trips_per_year(years)
    where('extract(year from start_date)= ?', years)
    .group('extract(year from start_date)')
    .order("count_id DESC").count(:id)
  end

  def self.most_and_least_ridden_bikes
    group(:bike_id).order("count_id DESC").count(:id).to_a
  end

  def self.subscription_type_breakout
    group(:subscription_type).order("count_id DESC").count(:id).to_a
  end

  def self.subscription_type_amounts
    subscription_type_breakout.map do |subscription|
      subscription[1]
    end.sum
  end

  def self.percentage_of_subscriber_type
    subscription_type_breakout.map do |subscription|
      ((subscription[1] / subscription_type_amounts.to_f) * 100).round(1)
    end
  end

  def self.date_with_most_trips
    group('(EXTRACT(MONTH FROM start_date))::integer')
      .group('(EXTRACT(DAY FROM start_date))::integer')
      .group('(EXTRACT(YEAR FROM start_date))::integer')
      .order('count_all').count.invert.max
  end

  def self.date_with_least_trips
    group('(EXTRACT(MONTH FROM start_date))::integer')
      .group('(EXTRACT(DAY FROM start_date))::integer')
      .group('(EXTRACT(YEAR FROM start_date))::integer')
      .order('count_all').count.invert.min
  end

  def self.most_frequent_destination(station)
    stations = where(start_station_id: station).group(:end_station_id).order('count_id DESC').count(:id).first
    Station.find(stations[0])[:name]
  end

  def self.most_frequent_origination(station)
    stations = where(end_station_id: station).group(:start_station_id).order('count_id DESC').count(:id).first
    Station.find(stations[0])[:name]
  end

  def self.date_with_highest_number_of_trips_started_at_this_station(station)
    date = where(start_station_id: station)
      .group('(EXTRACT(MONTH FROM start_date))::integer')
      .group('(EXTRACT(DAY FROM start_date))::integer')
      .group('(EXTRACT(YEAR FROM start_date))::integer')
      .order('count_all').count.first.first
    date.join("/")
  end

  def self.most_frequent_zip_code_for_users_starting_trips_at_this_station(station)
    where(start_station_id: station)
      .group(:zip_code)
      .order('count_id DESC').count(:id).first[0]
  end

  def self.bike_id_most_frequently_starting_a_trip_at_this_station(station)
    where(start_station_id: station)
      .group(:bike_id)
      .order('count_id DESC')
      .count(:id).first[0]
  end
end
