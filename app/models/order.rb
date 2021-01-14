class Order < ApplicationRecord
  validates :name, :address, :email, presence: true
  has_many :line_items, dependent: :destroy
  has_many :users
  

  enum pay_type: {
    'Debit card' => 0,
    'Credit card' => 1,
    'Net Banking' => 2
  }

  validates :pay_type, inclusion: pay_types.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  

    
end
