require 'pry'

class Condition < ActiveRecord::Base

    validates_presence_of :max_temperature_f,
                          :mean_temperature_f,
                          :min_temperature_f,
                          :mean_humidity,
                          :mean_wind_speed_mph,
                          :mean_visibility_miles,
                          :mean_wind_speed_mph,
                          :precipitation_inches

end
