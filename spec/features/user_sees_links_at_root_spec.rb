require 'spec_helper'

describe "when a visitor visits the root" do
<<<<<<< HEAD
=======
  before(:each) do
    @station =  Station.create!(id: 1, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @station1 =  Station.create!(id: 2, name: "that station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @trip =  Trip.create!(duration: "5", start_date: "12/12/2017", start_station_id: 2,start_station_name: "Train", end_date: "12/12/2017", end_station_name: "California", end_station_id:2,bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @trip1 =  Trip.create!(duration: "5", start_date: "12/12/2017",  start_station_id: 2, start_station_name: "Train", end_date: "12/12/2017", end_station_name: "California", end_station_id:2, bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @condition = Condition.create!(date:  "12/12/2017", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
  end

>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed
  it "sees the two links and welcome message" do
    visit '/'

    expect(page).to have_content("Welcome to Bike Share")
  end

<<<<<<< HEAD
=======
  it "should receive a status code in the 200s" do
    visit '/'

    page.status_code.should == 200
  end

  it "should receive an error code for a non exisiting route" do
    visit '/poopoo'

    page.status_code.should == 404
  end

>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed
  it "sees the stations index page after clicking the correct link" do
    visit '/'
    click_link('Stations')

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Bike station details")
  end

  it "sees the trips index page after clicking the correct link" do
    visit '/'

    click_link('Trips')

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Trip details")
  end

  it "sees the weather index page after clicking the correct link" do
<<<<<<< HEAD
       Condition.create!(
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          mean_wind_speed_mph: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph: 2)

=======
>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed
    visit '/'

    click_link('Conditions')

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("Weather conditions")
  end

  it "sees the station dashboard page after clicking the correct link" do
<<<<<<< HEAD
      date = DateTime.new(5-14-2010)
      Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id: 1)
      Station.create(id: 1,name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

    visit '/'
    # binding.pry
=======
    visit '/'
>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed
    click_on('Stations dashboard')

    expect(current_path).to eq("/station-dashboard")
    expect(page).to have_content("Station Dashboard")

  end

<<<<<<< HEAD
  it "sees the station dashboard page after clicking the correct link" do
      date = DateTime.new(5-14-2010)
      Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id: 1)
      Station.create(id: 1,name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

    visit '/'
    # binding.pry
=======
  it "sees the trip dashboard page after clicking the correct link" do
    visit '/'
>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed
    click_on('Trips dashboard')

    expect(current_path).to eq("/trips-dashboard")
    expect(page).to have_content("Trips Dashboard")
  end

<<<<<<< HEAD
    it "sees the station dashboard page after clicking the correct link" do
      visit '/'
      # binding.pry
      click_on('Weather dashboard')

      expect(current_path).to eq("/weather-dashboard")
      expect(page).to have_content("Weather dashboard")
    end
=======
  it "sees the station dashboard page after clicking the correct link" do
    visit '/'

    click_on('Weather dashboard')

    expect(current_path).to eq("/weather-dashboard")
    expect(page).to have_content("Weather dashboard")
  end
>>>>>>> 11d9348d6aebd4769ff3427d324595ef4d68b4ed


end
