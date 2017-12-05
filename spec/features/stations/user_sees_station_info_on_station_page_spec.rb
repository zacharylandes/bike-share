require 'spec_helper'

describe "When a user visits station page" do
    it "they can view that station they clicked on" do
      Station.create!( id:1, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create!( id:2, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id:1)

      visit "/stations/1"

      expect(current_path).to eq("/stations/1")
      expect(page).to have_content("That station")
      expect(page).to have_content("Los Angeles")
    end

    it "they get a sucess code when looking  for an existing station" do
      Station.create!( id:1, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Station.create!( id:2, name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
      Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id:1)

      visit "/stations/1"

      page.status_code.should == 200
    end


end
