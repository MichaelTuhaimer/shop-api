class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 0..500 }
  validates :category, presence: true
  validates :perishable, presence: true
  validates :perishable, length: { in: 0..1 }
  validates :stock, presence: true

  def tax
    price * 0.09
  end

  def total
    (price + tax).round(2)
  end
end
