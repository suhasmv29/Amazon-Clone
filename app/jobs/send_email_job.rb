class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(order)
    OrderMailer.new_order_email(order).deliver_later(wait: 2.minute)
  end
end
