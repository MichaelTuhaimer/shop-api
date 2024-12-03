require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/items.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Item.count, data.length
  end

  test "show" do
    item = Item.first
    get "/items/#{item.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "category", "price", "tax", "total", "description", "perishable", "stock", "created_at", "updated_at"].sort, data.keys.sort
  end

  test "create" do
    assert_difference "Item.count", 1 do
      post "/items.json", params: { name: "test", category: "test category", price: 10, description: "test description", perishable: 1, stock: 10 }
      assert_response 200
    end

    assert_difference "Item.count", 0 do
      post "/items.json", params: {}
      assert_response 422
    end
  end

  test "update" do
    item = Item.first
    patch "/items/#{item.id}.json", params: { name: "Updated name", category: "Updated category", description: "Updated description" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal "Updated category", data["category"]
    assert_equal item.price.to_s, data["price"]
    assert_equal "Updated description", data["description"]
    assert_equal item.perishable, data["perishable"]
    assert_equal item.stock, data["stock"]

    patch "/items/#{item.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Item.count", -1 do
      delete "/items/#{Item.first.id}.json"
      assert_response 200
    end
  end
end
