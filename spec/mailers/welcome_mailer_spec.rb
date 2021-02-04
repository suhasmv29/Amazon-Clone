require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe "#welcome_send" do
    let!(:user) { create(:user) }
        
    let(:mail) { WelcomeMailer.welcome_send(user)}

    it "Checking the subject" do
      expect(mail.subject).to eq("Welcome to my site")
    end
    it 'Checking the mail to:' do
      expect(mail.to).to eq([user.email])
    end
    it 'Checking the from: ' do
      expect(WelcomeMailer.deliveries.count).to eq 1
      expect(mail.from).to eq(["suhasmv29@gmail.com"])
    end


  end
end
