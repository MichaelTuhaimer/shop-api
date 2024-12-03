require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "tax" do
    item = Item.new(price: 100)
    assert_in_delta 9, item.tax
  end

  test "total" do
    item = Item.new(price: 100)
    assert_in_delta 109, item.total
  end
end
