class WelcomeMailer < ApplicationMailer

    def welcome_send(user)
        @user = user
        mail to: user.email, subject: 'Welcome to my site', from: 'suhasmv29@gmail.com'
    end

    def send_welcome_email(user)
        @user = user
        mail to: user.email, subject: 'Welcome to my site', from: 'suhasmv29@gmail.com'
    end

end
