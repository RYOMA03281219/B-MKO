class OrderDetail < ApplicationRecord
  def subtotal
    purchase_price * amount
  end

  belongs_to :order
  belongs_to :item
end
