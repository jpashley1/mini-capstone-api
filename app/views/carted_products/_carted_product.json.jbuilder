json.carted_products @carted_products do |carted_product|
  json.id carted_product.id
  json.user_id carted_product.user_id
  json.order_id carted_product.order_id
  json.quantity carted_product.quantity
  json.status carted_product.status
  json.product do
    json.id carted_product.product.id
    json.name carted_product.product.name
    json.price carted_product.product.price
    json.description carted_product.product.description
  end
end

json.total_quantity @carted_products.sum(:quantity)
json.total_price @carted_products.sum { |cp| cp.product.price * cp.quantity }

