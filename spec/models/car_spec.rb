require 'spec_helper'

describe Car do
  before(:each) do
    FactoryGirl.create(:car)
  end
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:mileage) }
  it { should validate_numericality_of(:year).is_greater_than_or_equal_to(1980) }
end
