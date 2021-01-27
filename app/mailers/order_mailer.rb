class OrderMailer < ApplicationMailer
    def new_order_email(order)
        @order = order
    
        mail(to: @order.email, subject: "You got a new order!")
    end
end
