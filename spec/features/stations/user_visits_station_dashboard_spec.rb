require 'spec_helper'

describe "when a visitor visits the trips-dashboard" do
  it "sees trips analytics" do
        date = DateTime.new(5-14-2010)
        Station.create!( name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")
        Station.create!( name: "That station", dock_count: 2, city: "Los Angeles", installation_date: "02-03-1204")

    visit '/station-dashboard'

    expect(page).to have_content("Station Dashboard")
  end
end
