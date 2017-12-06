require 'spec_helper'

describe "When a user visits /trips/new" do
  it "they can create a new trip" do
    Trip.create!(duration: "5", start_date: "04/03/1204", start_station_name: "Train", end_date:"04/03/1204", end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 2, end_station_id:2)
    visit "/trips/new"

    fill_in "trip[duration]", with: "77"
    fill_in "trip[start_date]", with: "2013-08-29"
    fill_in "trip[start_station_name]", with: "Golden Gate at Polk"
    fill_in "trip[end_date]", with: "2013-08-29"
    fill_in "trip[end_station_name]", with: "Adobe on Almaden"
    fill_in "trip[bike_id]", with: "679"
    fill_in "trip[subscription_type]", with: "Subscriber"

    page.find("#btn_submit").click

    expect(page).to have_content("Adobe on Almaden")
    expect(current_path).to eq("/trips")
  end

  it "they can create another new trip" do
    visit "/trips/new"

    fill_in "trip[duration]", with: "7"
    fill_in "trip[start_date]", with: "2012-08-29"
    fill_in "trip[start_station_name]", with: "Penn Station"
    fill_in "trip[end_date]", with: "2013-08-29"
    fill_in "trip[end_station_name]", with: "That station"
    fill_in "trip[bike_id]", with: "67"
    fill_in "trip[subscription_type]", with: "Subscriber"

    page.find("#btn_submit").click
    expect(current_path).to eq("/trips")
  end
end
