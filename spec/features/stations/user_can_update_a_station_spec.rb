require 'spec_helper'

describe "When a user makes changes to a stations information" do
  it "saves this new info to the database" do
    Station.create!(id: 2, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
    Condition.create!(date: "2107-12-12 00:00:00 UTC", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)

    visit '/stations/2/edit'

    expect(find_field('station[name]').value).to eq 'The station'
    expect(find_field('station[dock_count]').value).to eq "33"
    expect(find_field('station[city]').value).to eq "San Francisco"
    expect(find_field('station[installation_date]').value).to eq "12/12/2017"


    fill_in 'station[name]', with: "Paddington"
    fill_in 'station[dock_count]', with: 44
    fill_in 'station[city]', with: "London"
    fill_in 'station[installation_date]', with: "04/03/1204"

    page.find("#btn_submit").click
    expect(current_path).to eq("/stations/2")
    expect(page).to have_content("London")
    expect(page).to have_content(44)
    expect(page).to have_content("04/03/1204")
  end
end
