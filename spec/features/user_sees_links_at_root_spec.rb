require 'spec_helper'

describe "when a visitor visits the root" do
  before(:each) do
    @station =  Station.create!(id: 1, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @station1 =  Station.create!(id: 2, name: "that station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    @trip =  Trip.create!(duration: "5", start_date: "12/1/2017", start_station_id: 2,start_station_name: "Train", end_date: "12/1/2017", end_station_name: "California", end_station_id:2,bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @trip1 =  Trip.create!(duration: "5", start_date: "12/22/2017",  start_station_id: 2, start_station_name: "Train", end_date: "12/2/2017", end_station_name: "California", end_station_id:2, bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @trip2 =  Trip.create!(duration: "5", start_date: "12/22/2017",  start_station_id: 2, start_station_name: "Train", end_date: "12/22/2017", end_station_name: "California", end_station_id:2, bike_id: "540", subscription_type: "Subscriber", zip_code: "80219")
    @condition = Condition.create!(date: "12/12/2017", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
    @condition2 = Condition.create!(date: "12/2/2017", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
    @condition3 = Condition.create!(date: "12/22/2017" , max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)
  end

  it "sees the two links and welcome message" do
    visit '/'

    expect(page).to have_content("Welcome to Bike Share")
  end

  it "should receive a status code in the 200s" do
    visit '/'

    page.status_code.should == 200
  end

  it "should receive an error code for a non exisiting route" do
    visit '/poopoo'

    page.status_code.should == 404
  end

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
    visit '/'

    click_link('Conditions')

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("Weather conditions")
  end

  it "sees the station dashboard page after clicking the correct link" do
    visit '/'
    click_on('Stations dashboard')

    expect(current_path).to eq("/station-dashboard")
    expect(page).to have_content("Station Dashboard")

  end

  it "sees the trip dashboard page after clicking the correct link" do
    visit '/'
    click_on('Trips dashboard')

    expect(current_path).to eq("/trips-dashboard")
    expect(page).to have_content("Trips Dashboard")
  end

  it "sees the station dashboard page after clicking the correct link" do
    visit '/'

    click_on('Weather dashboard')

    expect(current_path).to eq("/weather-dashboard")
    expect(page).to have_content("Weather dashboard")
  end


end
