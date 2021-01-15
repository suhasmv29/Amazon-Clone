class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :total

  def new
    
  end

  def create


    customer = Stripe::Customer.create({email: params[:stripeEmail],source: params[:stripeToken]})

    charge = Stripe::Charge.create({customer: customer.id, amount: @amount,description: 'Rails Stripe customer',currency: 'usd'})
    # redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    
  end

  private
  def total

    @order = Order.where(user_id: current_user.id).last
    @line = LineItem.where(order_id: @order)
    amt = 0
    @line.each do |line|
      amt += (line.quantity.to_i * line.product.price)
    end
    @amount = amt.to_i

  end
end

