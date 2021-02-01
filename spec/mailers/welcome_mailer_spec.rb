require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe "notify" do
    before do
      sign_in(create(:user))
    end
        
    let(:mail) { WelcomeMailer.signup }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["suhasmv29@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
