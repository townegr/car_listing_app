require 'spec_helper'

feature 'record a newly acquired car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

  # ACCEPTANCE CRITERIA:
  # I must specify the color, year, and mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car.

  scenario 'create a newly acquired car record' do
    prev_count = Car.count
    visit new_car_url

    fill_in 'Color', with: 'Black'
    select 1980, from: 'Year'
    fill_in 'Mileage', with: '1000'
    fill_in 'Description', with: 'Well, the engine still works.'
    click_button 'Add Car'

    expect(page).to have_content('Your car was added')
    expect(Car.count).to eq(prev_count + 1)
  end

  scenario 'create an invalid car record' do
    prev_count = Car.count
    visit new_car_url
    click_button 'Add Car'

    expect(page).to have_content("can't be blank")
    expect(Car.count).to eq(prev_count)
  end
end
