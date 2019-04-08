# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    product.price * quantity
  end

  def total_qty
    quantity.to_i
  end
end
