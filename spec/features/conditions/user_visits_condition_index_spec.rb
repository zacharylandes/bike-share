require 'spec_helper'

describe "when a visitor visits the conditions index" do
  it "sees a list of all the conditions" do
    visit '/conditions'

    expect(page).to have_content("Weather conditions")
  end
  
  it "can click the link to create a new condition" do
    visit '/conditions'
    click_link('Create new condition')

    expect(page).to have_current_path("/conditions/new")
    expect(page).to have_content("Make new condition")
  end

  it "clicks the name of the condition to display its information" do
       Condition.create!(
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_link('2013-08-31')

    expect(page).to have_content("2")
    expect(page).to have_content("4")
    page.status_code.should == 200

  end

  it "clicks edit to display the edit condition page" do
       Condition.create!( 
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_on('Edit')
 
    expect(page).to have_current_path("/conditions/1/edit")
  end

  it "clicks delete condition to destroy the condition" do
       Condition.create!(
          date: '2013-08-31',
          max_temperature_f: 2,
          mean_temperature_f: 2,
          min_temperature_f: 3,
          mean_humidity: 3,
          mean_visibility_miles: 4,
          precipitation_inches: 2,
          mean_wind_speed_mph:2
        )
    visit '/conditions'

    click_on('Delete')

    expect(page).to have_content("Weather conditions")
     expect(Condition.count).to eq(0)
  end


end