namespace :batch do
  desc 'Send out batch messages'
  task send_messages: :environment do
    # The code to actually send our messages would go here
    user = User.last
    # @user.each do |user|
    WelcomeMailer.welcome_send(user).deliver!
  end
end
