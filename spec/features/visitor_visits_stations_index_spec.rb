require 'spec_helper'

describe "when a visitor visits the stations index" do
  it "sees a descriptive explanation message" do
    visit '/stations'

    expect(page).to have_content("Explore the stations near you")
  end

  it "can click the link to create a new station" do
    visit '/stations'
    click_link('Create a new station')

    expect(page).to have_current_path("/stations/new")
    expect(page).to have_content("Make a new station")
  end

  it "clicks the name of the station to display its information" do
    Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
    date = DateTime.new(5-14-2010)
    Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1,end_station_id:2)
    visit '/stations'

    click_link('The station')

    expect(page).to have_content("Dock Count")
  end

  it "clicks the edit link and is presented an edit form" do
    Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
    visit '/stations'
    click_link('Edit')

    expect(page).to have_content("Edit your station")
  end

  it "clicks the delete button which deletes station and redirects to index" do
    Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
    visit '/stations'
    click_on('delete')

    expect(page).to have_content("Bike Station Details")
    expect(Station.count).to eq(0)
  end

end
