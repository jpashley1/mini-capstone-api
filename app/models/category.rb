class Category < ApplicationRecord
  has_many :products, through: :category_products
  has_many :category_products


  # BONUS: In your Category model, make a products method that returns all the products associated with that category. (You’ll need to loop through all the category_products and find the associated products…)



  


end
