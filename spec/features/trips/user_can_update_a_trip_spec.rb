require 'spec_helper'

describe "When a user makes changes to a trips information" do
  it "saves this new info to the database" do
    Station.create!(id: 2, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
    Condition.create!(date: "2107-12-12 00:00:00 UTC", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)

    visit '/trips/1/edit'

    expect(find_field('trip[duration]').value).to eq '5'
    expect(find_field('trip[start_date]').value).to eq "2010-04-05 00:00:00 UTC"
    expect(find_field('trip[start_station_name]').value).to eq "Train"
    expect(find_field('trip[end_date]').value).to eq "2010-04-05 00:00:00 UTC"
    expect(find_field('trip[end_station_name]').value).to eq "California"
    expect(find_field('trip[bike_id]').value).to eq "540"
    expect(find_field('trip[subscription_type]').value).to eq "Subscriber"
    expect(find_field('trip[zip_code]').value).to eq "80219"
  


    fill_in 'trip[duration]', with: '6'
    fill_in 'trip[start_date]', with: "05/05/2010"
    fill_in 'trip[start_station_name]', with: "Train!"
    fill_in 'trip[end_date]', with: "05/06/2010"
    fill_in 'trip[end_station_name]', with: "California!"
    fill_in 'trip[bike_id]', with: "541"
    fill_in 'trip[subscription_type]', with: "Subscriber!"
    fill_in 'trip[zip_code]', with: "80214"



    page.find("#btn_submit").click
    expect(current_path).to eq("/trips")
    expect(page).to have_content("California!")
    expect(page).to have_content("541")
    
  end
end
