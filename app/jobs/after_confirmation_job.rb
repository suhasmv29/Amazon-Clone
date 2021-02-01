class AfterConfirmationJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    @user = user
    # WelcomeMailer.send_welcome_email(@user).deliver_later(wait: 2.minute)
    WelcomeMailer.send_welcome_email(@user).deliver_later(wait: 2.minute)
  end
end
