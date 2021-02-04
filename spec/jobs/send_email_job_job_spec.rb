require 'rails_helper'
RSpec.describe SendEmailJob, type: :job do
  include ActiveJob::TestHelper
  let!(:user) { create(:user) }

  subject(:job) { described_class.perform_later(user) }
  it 'queues the job' do
    expect { job }.to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end
  it 'matches with enqueued job' do
    expect { described_class.perform_later }.to have_enqueued_job(described_class)
  end
  it 'is in default queue' do
    expect(described_class.new.queue_name).to eq('default')
  end

  it 'Send the mail' do
    expect do
      perform_enqueued_jobs do
        WelcomeMailer.welcome_send(user).deliver_later(wait: 2.minute)
      end
    end.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end