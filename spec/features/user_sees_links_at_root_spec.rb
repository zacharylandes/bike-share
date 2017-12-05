require 'spec_helper'

describe "when a visitor visits the root page" do
  # it "sees trips analytics when it click trips dashboard"  do
  #       date = DateTime.new(5-14-2010)
  #       Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
  #   visit '/'
  #
  #   click_on('Trips dashboard')
  #
  #
  #   expect(page).to have_content("Trips Dashboard")
  # end

  it "sees all  trips when it click trips button"  do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
    visit '/'
    click_on('Trips')

    expect(page).to have_content("Trip details")
  end


  it "sees all  trips when it click trips button"  do
        date = DateTime.new(5-14-2010)
        Trip.create!(duration: "5", start_date: date, start_station_name: "Train", end_date: date, end_station_name: "California", bike_id: "540", subscription_type: "Subscriber", zip_code: "80219", start_station_id: 1)
    visit '/'
    click_on('Stations')

    expect(page).to have_content("Bike station details")
  end
end


  # it "clicks the edit link and is presented an edit form" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/stations'
  #   click_link('Edit')
  #
  #   expect(page).to have_content("Edit your station")
  # end
  #
  # it "clicks the delete button which deletes station and redirects to index" do
  #   Station.create(name: "The station", dock_count: 33, city: "San Francisco", installation_date: "04-03-1204")
  #   visit '/stations'
  #   click_on('delete')
  #
  #   expect(page).to have_content("Bike Station Details")
  #   expect(Station.count).to eq(0)
  # end

# end