require 'rails_helper'

RSpec.describe User, type: :model do

  # subject { User.create }

  context 'validates the presence' do
    # binding.pry
    # expect { subject.welcome_send(User.first) }
    #   .to change { ActionMailer::Base.deliveries.count }.by(1)
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { is_expected.to have_one(:cart) }

  end
  describe '#welcome_send' do
    context 'Sending the job' do
      let!(:user) { create(:user) }
      
      # Checking job class name 
      it "Checking job class name " do
        expect{
          user.welcome_send
        }.to have_enqueued_job(SendEmailJob)
      end
  
      # Checking job queue name 
      it "Checking job queue name " do
        expect {
          user.welcome_send
        }.to have_enqueued_job.on_queue("default")
      end
      it "uploads a backup" do
        expect(SendEmailJob).to have_been_enqueued.exactly(:once)
      end
    end
  end
end

