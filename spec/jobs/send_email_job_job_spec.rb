require 'rails_helper'

RSpec.describe SendEmailJob, type: :job do


    include ActiveJob::TestHelper
    let(:order) { create :order }
    it 'job is created for order' do
        ActiveJob::Base.queue_adapter = :test
        expect {
            OrderMailer.new_order_email(order).deliver_later
        }.to have_enqueued_job.on_queue('mailers')
    end
    it 'Order conformation email is sent' do
        expect {
            perform_enqueued_jobs do
                OrderMailer.new_order_email(order).deliver_later(wait: 2.minute)
            end
        }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
    it 'Order conformation is sent to the right user' do
        perform_enqueued_jobs do
            OrderMailer.new_order_email(order).deliver_later(wait: 2.minute)
        end
    
        mail = ActionMailer::Base.deliveries.last
        expect(mail.to[0]).to eq order.email
    end
    it 'mail job performance' do
        perform_enqueued_jobs do
            described_class.perform_later(order) 
        end
        expect(Order.count).to eq 1
    end
end
