require 'rails_helper'

RSpec.describe SendEmailJob, type: :job do
    # def queue_adapter_for_test
    #   ActiveJob::QueueAdapters::DelayedJobAdapter.new
    # end

    describe '#perform' do
      context 'User' do
        let!(:user) { create(:user) }
        it "Checking job queue name " do
          expect {
            SendEmailJob
          }.to have_enqueued_job.on_queue("default")
        end

      end
    end
   
end
