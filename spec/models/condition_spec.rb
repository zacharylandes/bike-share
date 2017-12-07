require 'spec_helper'

RSpec.describe Condition do
  describe 'Class Methods' do
    before(:each) do
      @station = Station.create!(id: 2, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
      @trip1 = Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
      @trip2 = Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
      @trip3 = Trip.create!(duration: "5", start_date: "04/03/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
      @trip4 = Trip.create!(duration: "5", start_date: "04/02/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
      @condition1 = Condition.create!(date: "05/04/2010", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
      @condition3= Condition.create!(date: "04/02/2010", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
      @condition4= Condition.create!(date: "04/02/2010", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
      @condition5= Condition.create!(date: "04/03/2010", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
    end

    describe '.weather_on_days_with_highest_number_of_rides' do
      it 'shows weather on days with weather on days with highest number of rides' do

        expect(Condition.weather_on_days_with_highest_number_of_rides.first.date).to eq("2010-04-05 00:00:00 UTC")
      end
    end

    describe '.weather_on_days_with_lowest_number_of_rides' do
      it 'shows weather on days with weather on days with highest number of rides' do

        expect(Condition.weather_on_days_with_lowest_number_of_rides.first.date).to eq("2010-04-05 00:00:00.000000000 +0000")
      end
    end
  end

end
