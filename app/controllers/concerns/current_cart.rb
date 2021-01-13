module CurrentCart
  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      # c =Cart.where("user_id = :user_id", { user_id: current_user.id}).ids
      # if c.include?(current_user.id)
      #   @cart = c
        # if current_user.id.present?
        #   @c = Cart.all
      @cart = Cart.create
      # @cart = Cart.all
      session[:cart_id] = @cart.id
    end
  #   # def set_cart
  #   #   if session[:cart_id]
  #   #     cart = Cart.find_by(:id => session[:cart_id])
  #   #     if cart.present?
  #   #       @cart = cart
  #   #     else
  #   #       session[:cart_id] = nil
  #   #     end
  #   #   end

  #   #   if session[:cart_id] == nil
  #   #     @cart = Cart.create
  #   #     session[:cart_id] = @cart.id
  #   #   end
  #   # end

  # end
  # def set_cart
  #   if session[:cart_id]
  #     @cart = Cart.find(session[:cart_id])
  #   else
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
  # end
  # def set_cart
  #   begin
  #     @cart = Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
  # end
  
end
