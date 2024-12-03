class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.decimal :price
      t.text :description
      t.integer :perishable
      t.integer :stock

      t.timestamps
    end
  end
end
