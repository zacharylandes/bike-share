require './app/models/station'
require 'csv'

stations = CSV.open './db/csv/station.csv', headers:true, header_converters: :symbol
stations.each do |row|
  Station.create!(name: row[:name], dock_count: row[:dock_count], city: row[:city], installation_date: row[:installation_date])
end
