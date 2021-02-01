# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
    def  welcome_send
        # Set up a temporary order for the preview
        user = User.new(email: "joe@gmail.com", password:'smvpmv', password_confirmation: 'smvpmv')
    
        WelcomeMailer.with(user: user).welcome_send
    end

end
