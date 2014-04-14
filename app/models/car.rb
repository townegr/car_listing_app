class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1980 }
  validates :mileage, presence: true

  belongs_to :manufacturer
end
