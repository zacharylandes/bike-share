require 'pry'
require'./app/models/condition-dashboard/ranges'
require'./app/models/condition-dashboard/relations'
require'./app/models/condition-dashboard/averages'
require'./app/models/condition-dashboard/highest'


class Condition < ActiveRecord::Base
extend Ranges
extend Relations
extend Averages
extend Highest

has_many :trips, foreign_key: "start_date", primary_key: "date"



def self.lowest_number_of_rides_from_temp(temp_floor)
  condition_trips(temp_floor).values.min
end

def self.lowest_number_of_rides_from_visibility(temp_floor)
  condition_trips_vis(temp_floor).values.min
end

def self.lowest_number_of_rides_from_prec(floor)
  condition_trips_prec(floor).values.min
end

def self.lowest_number_of_rides_from_wind(wind_floor)
  condition_trips_wind(wind_floor).values.min
end

def self.weather_on_days_with_highest_number_of_rides
   high_dates = Trip.group(:start_date).order("count_id DESC").count(:id)
   Condition.where(:date => high_dates.keys.first)
end

def self.weather_on_days_with_lowest_number_of_rides
   high_dates = Trip.group(:start_date).order("count_id DESC").count(:id)
   Condition.where(:date => high_dates.keys.last)
end

   # validates_presence_of :max_temperature_f,
   #                        :mean_temperature_f,
   #                        :min_temperature_f,
   #                        :mean_wind_speed_mph,
   #                        :mean_visibility_miles,
   #                        :mean_wind_speed_mph,
   #                        :precipitation_inchesend
  # extend Ranges
end
