require 'pry'

class Condition < ActiveRecord::Base
  def average_number_of_rides(days)

  end

  # private
  def self.days_in_high_temperature_chunks
    high_temperature_chunks.map do |temperature_range|
      [temperature_range, days_in_temperature_range(temperature_range)]
    end
  end

  def self.rides_per_date
    counts = days_in_high_temperature_chunks.first[1].group_by{|x|x}
    counts.values.count
  end



  def self.high_temperature_chunks
    chunk_size = 10
    min = (Condition.minimum(:max_temperature_f) / chunk_size).floor * chunk_size
    max = (Condition.maximum(:max_temperature_f) / chunk_size).ceil * chunk_size
    (min..max).step(chunk_size).map { |x| x..x+(chunk_size-1) }
  end

  def self.days_in_temperature_range(temperature_range)
    amount = Condition.where(max_temperature_f: temperature_range).group(:date).order("count_id DESC").count(:id)

  end
   # validates_presence_of :max_temperature_f,
   #                        :mean_temperature_f,
   #                        :min_temperature_f,
   #                        :mean_wind_speed_mph,
   #                        :mean_visibility_miles,
   #                        :mean_wind_speed_mph,
   #                        :precipitation_inches


end
