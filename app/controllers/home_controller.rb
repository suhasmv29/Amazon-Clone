class HomeController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index

    @products = Product.order(:title)
    
    if current_user.present?
      @order = Order.where(user_id: current_user.id)
    end
    

  end
end
