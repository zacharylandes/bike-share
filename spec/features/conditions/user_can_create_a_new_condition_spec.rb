require 'spec_helper'

describe "When a user visits /conditions/new" do
  it "they can create a new condition" do
    visit "/conditions/new"

    fill_in "condition[max_temperature_f]", with: "11.1"
    fill_in "condition[min_temperature_f]", with: "58.0"
    fill_in "condition[mean_temperature_f]", with: "58.0"
    fill_in "condition[mean_humidity]", with: "68.0"
    fill_in "condition[mean_visibility_miles]", with: "10.0"
    fill_in "condition[mean_wind_speed_mph]", with: "13.0"

    page.find("#btn_submit").click

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("11.1")
    expect(Condition.count).to eq(1)

  end
  it "they can create a another condition" do
    visit "/conditions/new"

    fill_in "condition[max_temperature_f]", with: "11"
    fill_in "condition[min_temperature_f]", with: "5.0"
    fill_in "condition[mean_temperature_f]", with: "28.0"
    fill_in "condition[mean_humidity]", with: "8.0"
    fill_in "condition[mean_visibility_miles]", with: "1.0"
    fill_in "condition[mean_wind_speed_mph]", with: "1.0"

    page.find("#btn_submit").click

    expect(current_path).to eq("/conditions")
    expect(page).to have_content("5.0")
    page.status_code.should == 200
    expect(Condition.count).to eq(1)
  end
end
