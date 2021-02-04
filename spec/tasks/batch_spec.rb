require 'rails_helper'

Rails.application.load_tasks

describe "batch_send_messages" do
    let!(:user) { create(:user) }

  context "foo case" do


    it "it does sends messages" do
      Rake::Task["batch:send_messages"].invoke
      # assert the expected behaviour here related for foo case
    end
    it 'Checking the mail is being called' do
        expect do
         perform_enqueued_jobs do
            WelcomeMailer.welcome_send(user).deliver!
          end
        end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end