json.extract! product, :name, :price, :image_url, :description
json.url product_url(product, format: :json)
