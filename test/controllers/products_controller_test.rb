require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  #test 1
  test "index" do
    get "/products.json"
    assert_response 200
    
    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end
  #test 2
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200
  
    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "created_at", "updated_at", "stock", "supplier_id", "images"], data.keys
  end
  #test 3
  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "instrument", price: 20, description: "it makes music", stock: 5, supplier_id: 25}
      assert_response 200
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end

  end

  #test 4
  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
  #test 5
  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
