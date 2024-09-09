class Product < ApplicationRecord
  # # Name - presence - uniqueness
  # validates :name, uniqueness: true
  # validates :name, presence: true
  # # Price - presence - numericality and not a negative number or 0
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  # # Description - length of a minimum of 1 and a maximum of 500 characters

  #   def is_discounted?
  #     if price <= 10
  #       return true
  #     else
  #       return false
  #     end
  #   end

  #   def tax
  #     price * 0.09
  #   end

  #   def total
  #     tax = price * 0.09
  #     return price + tax
  #   end
end
