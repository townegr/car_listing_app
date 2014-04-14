require 'spec_helper'

feature 'associate car listing with manufacturer', %Q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
  } do

  # ACCEPTANCE CRITERIA:
  # When recording a car listing, I want to optionally associate it with its manufacturer.
  # If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.

  scenario 'record a manufacturer for a car listing' do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.build(:car, manufacturer: nil)
    visit new_car_url

    fill_in 'Color', with: car.color
    select car.year, from: 'Year'
    fill_in 'Mileage', with: car.mileage
    select manufacturer.name, from: 'Manufacturer'
    fill_in 'Description', with: car.description
    click_on 'Add Car'

    expect(page).to have_content('Your car was added')
    expect(Car.last.manufacturer).to eq(manufacturer)
    expect(page).to have_content(manufacturer.name)
  end
end
