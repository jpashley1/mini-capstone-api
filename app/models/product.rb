class Product < ApplicationRecord
  # Name - presence - uniqueness
  validates :name, uniqueness: true
  validates :name, presence: true
  # Price - presence - numericality and not a negative number or 0
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Description - length of a minimum of 1 and a maximum of 500 characters


end
