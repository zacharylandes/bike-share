class Station < ActiveRecord::Base

  validates_presence_of :name, :dock_count, :city, :installation_date

  def self.stations_with_max_bikes
    max = Station.maximum(:dock_count)
    station_max = Station.where(dock_count: max)
    station_max.map do |station|
      station.name
    end.join(',  ')
  end

  def self.stations_with_min_bikes
    min = Station.minimum(:dock_count)
    station_min = Station.where(dock_count: min)
    station_min.map do |station|
      station.name
    end.join(',  ')
  end

  def self.recently_installed_station
    min  = Station.minimum(:installation_date)
    newest = Station.find_by(installation_date: min)
    newest.name
  end

  def self.oldest_station
    max  = Station.maximum(:installation_date)
    oldest = Station.find_by(installation_date: max)
    oldest.name
  end

  




end
