require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200
    
    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end
  
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200
  
    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "created_at", "updated_at", "stock", "supplier_id", "images"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "lake!!", price: 800, description: "it's very nice and it is a lake i guess", stock: 3, supplier_id: 25}
      assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end

  end


  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
