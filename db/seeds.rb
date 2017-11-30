require './app/models/station'
require './app/models/trip'
require 'csv'

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: row[:installation_date])
end


trips = CSV.open './db/csv/trip_fixtures.csv', headers:true, header_converters: :symbol
trips.each do |row|
  # require 'pry';binding.pry
  Trip.create!(duration: row[:duration], start_date: row[:start_date], start_station_name: row[:start_station_name], end_date: row[:end_date], end_station_name: row[:end_station_name], bike_id: row[:bike_id], subscription_type: row[:subscription_type], zip_code: row[:zip_code])
end
