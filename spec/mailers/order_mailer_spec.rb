require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "Order Conformation" do
    let!(:order) { create(:order) }
    
    let(:mail) { OrderMailer.new_order_email(order)}

    it "Checking the subject" do
      expect(mail.subject).to eq("You got a new order!")
    end
    it 'Checking the mail to:' do
      expect(mail.to).to eq([order.email])
    end
    it 'Checking the from: ' do
      expect(mail.from).to eq(["from@example.com"])
    end
  end
end
