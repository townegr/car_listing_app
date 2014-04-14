# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color 'Blue'
    year 1980
    mileage '15000'
    description "She's a real beauty!"

    manufacturer
  end
end
