class ChangePriceToDecimal < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :price, "numeric USING CAST(price AS numeric)"
    change_column :items, :price, :decimal, precision: 9, scale: 2
  end
end
