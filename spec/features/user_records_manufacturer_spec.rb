require 'spec_helper'

feature "record a car manufacturer", %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  } do

  # ACCEPTANCE CRITERIA:
  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  scenario 'create a car manufacturer' do
    prev_count = Manufacturer.count
    visit new_manufacturer_url

    fill_in 'Name', with: 'Ford'
    select 'USA', from: 'Country'
    click_button 'Add Manufacturer'

    expect(page).to have_content('Manufacturer has been added')
    expect(Manufacturer.count).to eq(prev_count + 1)
  end

  scenario 'create an invalid car manufacturer' do
    prev_count = Manufacturer.count
    visit new_manufacturer_url
    click_button 'Add Manufacturer'

    expect(page).to have_content("can't be blank")
    expect(Manufacturer.count).to eq(prev_count)
  end
end
