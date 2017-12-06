require 'spec_helper'

describe "When a user visits condition page" do
    it "they can view that station they clicked on" do
      Station.create!( id:1, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create!( id:2, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id:1)
      Condition.create!( date: '2013-08-31', max_temperature_f: 2, mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, precipitation_inches: 2, mean_wind_speed_mph:2 )

      visit "/conditions/1"

      expect(current_path).to eq("/conditions/1")
      expect(page).to have_content("2013-08-31")
      expect(page).to have_content("2")
    end

    it "they get a sucess code when looking  for an existing condition" do
      Station.create!( id:1, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create!( id:2, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id:1)
      Condition.create!( date: '2013-08-31', max_temperature_f: 2, mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, precipitation_inches: 2, mean_wind_speed_mph:2 )

      visit "/conditions/1"

      page.status_code.should == 200
    end


end
