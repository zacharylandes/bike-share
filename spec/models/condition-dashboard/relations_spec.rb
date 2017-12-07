require 'spec_helper'

RSpec.describe Condition do
  before(:each) do
    @station =  Station.create!(id: 1, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @station1 =  Station.create!(id: 2, name: "that station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @trip =  Trip.create!(duration: "5", start_date: "12/12/2017", start_station_id: 2,start_station_name: "Train", end_date: "12/12/2017", end_station_name: "California", end_station_id:2,bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @trip1 =  Trip.create!(duration: "6", start_date: "12/12/2017",  start_station_id: 2, start_station_name: "Train", end_date: "12/12/2017", end_station_name: "California", end_station_id:2, bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @trip2 =  Trip.create!(duration: "7", start_date: "12/12/2017",  start_station_id: 2, start_station_name: "Train", end_date: "12/12/2017", end_station_name: "California", end_station_id:2, bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @condition = Condition.create!(date: "12/12/2017", max_temperature_f: 3, mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
    @condition1 = Condition.create!(date: "12/11/2017", max_temperature_f: 4, mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2.3)
  end

  describe 'Class Methods' do
    describe '.condition_trips' do
      it 'joins conditions with trips on the date key within the max temp range' do
        expect(Condition.condition_trips(0).values).to eq( [3])
      end
    end

    describe '.condition_trips_prec' do
      it 'joins conditions with trips on the date key within the max precipitation range' do
        expect(Condition.condition_trips_prec(2).values).to eq( [3])
      end
    end

    describe '.condition_trips_wind' do
      it 'joins conditions with trips on the date key within the max wind range' do
        expect(Condition.condition_trips_wind(4).values).to eq( [3])
      end
    end

    describe '.condition_trips_vis' do
      it 'joins conditions with trips on the date key within the max visibility range' do
        expect(Condition.condition_trips_vis(4).values).to eq( [3])
      end
    end
  end
end
