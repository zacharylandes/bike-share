require 'spec_helper'

describe "When a user visits /stations/new" do
  it "they can create a new station" do
    visit "/stations/new"

    fill_in "station[name]", with: "Paddington"
    fill_in "station[dock_count]", with: "100"
    fill_in "station[installation_date]", with: "8/6/2013"
    fill_in "station[city]", with: "London"

    page.find("#btn_submit").click

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Paddington")
    expect(page).to have_content("100")

  end
  it "they can create another new station" do
    visit "/stations/new"

    fill_in "station[name]", with: "Winters"
    fill_in "station[dock_count]", with: "10"
    fill_in "station[installation_date]", with: "8/6/2013"
    fill_in "station[city]", with: "London"

    page.find("#btn_submit").click

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Winters")
    expect(page).to have_content("10")
  end


end
