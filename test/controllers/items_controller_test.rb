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
    assert_equal ["id", "name", "category", "price", "perishable", "stock", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Item.count", 1 do
      post "/items.json", params: { name: "apple", category: "Fruit", price: 1, perishable: 1, stock: 10 }
      assert_response 200
    end
  end

  test "update" do
    item = Item.first
    patch "/items/#{item.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Item.count", -1 do
      delete "/items/#{Item.first.id}.json"
      assert_response 200
    end
  end
end
