require 'pry'

class Condition < ActiveRecord::Base

  # def self.average_number_of_rides(ride)
  #   (ride.values.sum)/(ride.values.count).to_f
  # end
  #
  # def self.days_in_high_temperature_chunks
  #   high_temperature_chunks.group_by do |temperature_range|
  #   days_in_temperature_range(temperature_range)
  #   end.invert
  # end
  #
  # def self.temp_calcs
  #    average = Hash.new(0)
  #     days_in_high_temperature_chunks.map do |ride|
  #       average[ride[0]] = average_number_of_rides(ride[1]) if ride[1].count > 0
  #     end
  #     average
  # end
  #
  # def self.max_temperature_f_per_temp
  #    max = Hash.new(0)
  #     days_in_high_temperature_chunks.map do |ride|
  #       max[ride[0]] = ride[1].values.max if ride[1].count > 0
  #     end
  #     max
  # end
  #
  # def self.min_temperature_f_per_temp
  #    min = Hash.new(0)
  #     days_in_high_temperature_chunks.map do |ride|
  #       min[ride[0]] = ride[1].values.min if ride[1].count > 0
  #     end
  #     min
  # end
  #
  #
  # def self.rides_per_date
  #   counts = days_in_high_temperature_chunks.first[1].group_by{|x|x}
  #   counts.values.count
  # end
  #
  # def self.high_temperature_chunks
  #   chunk_size = 10
  #   min = (Condition.minimum(:max_temperature_f) / chunk_size).floor * chunk_size
  #   max = (Condition.maximum(:max_temperature_f) / chunk_size).ceil * chunk_size
  #   (min..max).step(chunk_size).map { |x| x..x+(chunk_size-1) }
  # end
  #
  def self.highest_temperature_range(range)
  dates= where(max_temperature_f: range).group(:date).order("count_id DESC").count(:id).values
    # average(dates)
  end

  def self.average_per_date(range)
    (highest_temperature_range(range).sum)/(highest_temperature_range(range).count).to_f.round(2)
  end

    def self.highest_per_date(range)
        highest_temperature_range(range).max
    end

    def self.lowest_per_date(range)
        highest_temperature_range(range).min
    end

    # def self.highest_temperature_range(range)
    #   where(max_temperature_f: range).group(:date).order("count_id DESC").count(:id)
    # end

  # def self.percipitation_chunks
  #   chunk_size = 0.5
  #   min_temp_chunk(chunk_size)
  #   max_temp_chunk(chunk_size)
  #   (min..max).step(chunk_size).map { |x| x..x + (chunk_size ) }
  # end
  #
  # def min_temp_chunk(size)
  #   min = (Condition.minimum(:precipitation_inches) / size).floor * size
  # end
  #
  # def max_temp_chunk(size)
  #   max = (Condition.maximum(:precipitation_inches) / size).ceil * size
  # end
  #
  # def self.days_in_temperature_range(temperature_range)
  #   amount = Condition.where(max_temperature_f: temperature_range).group(:date).order("count_id DESC").count(:id)
  # end


   # validates_presence_of :max_temperature_f,
   #                        :mean_temperature_f,
   #                        :min_temperature_f,
   #                        :mean_wind_speed_mph,
   #                        :mean_visibility_miles,
   #                        :mean_wind_speed_mph,
   #                        :precipitation_inches


end
