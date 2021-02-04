# spec/whenever_spec.rb
require 'spec_helper'
require 'rails_helper'
require 'whenever'
require 'rake'



describe 'Whenever Schedule' do
  before do
    load 'lib/tasks/batch.rake' # Makes sure rake tasks are loaded so you can assert in rake jobs
  end

#   it 'makes sure `runner` statements exist' do
#     schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

#     assert_equal 2, schedule.jobs[:runner].count

#     # Executes the actual ruby statement to make sure all constants and methods exist:
#     schedule.jobs[:runner].each { |job| instance_eval job[:task] }
#   end

  it 'makes sure `rake` statements exist' do
    # config/schedule.rb file is used by default in constructor:
    schedule = Whenever::Test::Schedule.new(vars: { environment: '' })

    # Makes sure the rake task is defined:
    assert Rake::Task.task_defined?(schedule.jobs[:rake].first[:task])
  end

#   it 'makes sure cron alive monitor is registered in minute basis' do
#     schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')

#     # assert_equal 'http://myapp.com/cron-alive', schedule.jobs[:curl].first[:task]
#     assert_equal 'curl :send_messages', schedule.jobs[:curl].first[:command]
#     # assert_equal [:minute], schedule.jobs[:curl].first[:every]
#   end
end