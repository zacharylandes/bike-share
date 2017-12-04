require 'pry'

class Condition < ActiveRecord::Base
  def average_number_of_rides(days)
    
  end
  
  private
  def days_in_high_temperature_chunks
    high_temperature_chunks.map do |temperature_range|
      [temperature_range, days_in_temperature_range(temperature_range)]
    end
  end


  def high_temperature_chunks
    chunk_size = 10
    min = (Condition.minimum(:max_temperature_f) / chunk_size).floor * chunk_size
    max = (Condition.maximum(:max_temperature_f) / chunk_size).ceil * chunk_size
    (min..max).step(chunk_size).map { |x| x..x+(chunk_size-1) }
  end

  def days_in_temperature_range(temperature_range)
    Condition.distinct.where(max_temperature_f: temperature_range).pluck(:date)
  end
   validates_presence_of :max_temperature_f,
                          :mean_temperature_f,
                          :min_temperature_f,
                          :mean_humidity,
                          :mean_wind_speed_mph,
                          :mean_visibility_miles,
                          :mean_wind_speed_mph,
                          :precipitation_inches


end
