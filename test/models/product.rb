class Product < ApplicationRecord
end 
def is_discounted?
  if product.price <= 10
    true
  else
    false 
  end

  def tax
    "sales tax #{product.price * 0.09"}
  end


  def total
    product.price += product.price * 0.09

  end


end