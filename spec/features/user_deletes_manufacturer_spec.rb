require 'spec_helper'

feature "delete a car manufacturer", %Q{
  As a car salesperson
  I want to delete a car manufacturer
  So that I can remove manufacturers and associated listings
  } do

  # ACCEPTANCE CRITERIA:
  # I must delete specified manufacturer and associated car listings

  scenario 'deleting car manufacturer' do
    FactoryGirl.create(:manufacturer, name: 'Volvo')
    FactoryGirl.create_list(:manufacturer, 5)
    prev_count = Manufacturer.count
    visit manufacturers_url
    expect(page).to have_content('Volvo')

    click_on 'Delete Volvo'
    expect(page).to_not have_content('Volvo')
    expect(Manufacturer.count).to eq(prev_count - 1)
  end
end
