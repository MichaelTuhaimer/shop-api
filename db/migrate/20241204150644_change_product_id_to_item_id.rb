class ChangeProductIdToItemId < ActiveRecord::Migration[7.1]
  def change
    change_table :orders do |t|
      t.remove :product_id
      t.integer :item_id
    end
  end
end
