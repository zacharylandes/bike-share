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

  it "sees the stations index page after clicking the correct link" do
    visit '/'
    click_link('Trips')

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Trip details")
  end

end
