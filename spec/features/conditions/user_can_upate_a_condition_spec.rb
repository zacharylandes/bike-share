require 'spec_helper'

describe "When a user makes changes to conditions" do
  it "saves this new info to the database" do
    Station.create!(id: 2, name: "The station", dock_count: 33, city: "San Francisco", installation_date: "12/12/2017")
    Trip.create!(duration: "5", start_date: "05/04/2010", start_station_name: "Train", end_date: "05/04/2010", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
    Condition.create!(date: "2107-12-12 00:00:00 UTC", max_temperature_f: 3,mean_temperature_f: 2, min_temperature_f: 3, mean_humidity: 3, mean_visibility_miles: 4, mean_wind_speed_mph: 4, precipitation_inches: 2)

    visit '/conditions/1/edit'

    expect(find_field('condition[date]').value).to eq '2107-12-12 00:00:00 UTC'
    expect(find_field('condition[max_temperature_f]').value).to eq "3.0"
    expect(find_field('condition[mean_temperature_f]').value).to eq "2.0"
    expect(find_field('condition[min_temperature_f]').value).to eq "2.0"
    expect(find_field('condition[mean_humidity]').value).to eq "3.0"
    expect(find_field('condition[mean_visibility_miles]').value).to eq "4.0"
    expect(find_field('condition[mean_wind_speed_mph]').value).to eq "4.0"


    fill_in 'condition[date]', with: "2107-11-12 00:00:00 UTC"
    fill_in 'condition[max_temperature_f]', with: "13.0"
    fill_in 'condition[mean_temperature_f]', with: "14.0"
    fill_in 'condition[min_temperature_f]', with: "15.0"
    fill_in 'condition[mean_humidity]', with: "16.0"
    fill_in 'condition[mean_visibility_miles]', with: "17.0"
    fill_in 'condition[mean_wind_speed_mph]', with: "18.0"

    page.find("#btn_submit").click
    expect(current_path).to eq("/conditions/1")
    expect(page).to have_content("13.0")
    expect(page).to have_content("17.0")
    expect(page).to have_content("18.0")
  end
end
