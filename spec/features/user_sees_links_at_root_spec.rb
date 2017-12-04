require 'spec_helper'

describe "when a visitor visits the root" do
  it "sees the two links and welcome message" do
    visit '/'

    expect(page).to have_content("Welcome to Bike Share")
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
       Condition.create!(
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          mean_wind_speed_mph: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph: 2)

    visit '/'

    click_link('Conditions')

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("Weather conditions")
  end

  it "sees the station dashboard page after clicking the correct link" do
      date = DateTime.new(5-14-2010)
      Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id: 1)
      Station.create(id: 1,name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

    visit '/'
    # binding.pry
    click_on('Stations dashboard')

    expect(current_path).to eq("/station-dashboard")
    expect(page).to have_content("Station Dashboard")

  end

  it "sees the station dashboard page after clicking the correct link" do
      date = DateTime.new(5-14-2010)
      Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1, end_station_id: 1)
      Station.create(id: 1,name: "The station", dock_count: 23, city: "San Francisco", installation_date: "04-03-1204")

    visit '/'
    # binding.pry
    click_on('Trips dashboard')

    expect(current_path).to eq("/trips-dashboard")
    expect(page).to have_content("Trips Dashboard")
  end

    it "sees the station dashboard page after clicking the correct link" do
      visit '/'
      # binding.pry
      click_on('Weather dashboard')

      expect(current_path).to eq("/weather-dashboard")
      expect(page).to have_content("Weather dashboard")
    end


end
