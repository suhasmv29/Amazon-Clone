class StoreController < ApplicationController
  include CurrentCart

  before_action :set_cart
  def index

    @products = Product.order(:title)
    # @order = Order.where("user_id = :current_user.id", {user_id: current_user.id})
    if current_user.present?
      @order = Order.where(user_id: current_user.id)
    end

  end
end
