require 'spec_helper'
require 'rails_helper'
require 'whenever'
require 'rake'



describe 'Whenever Schedule' do
  before do
    load 'lib/tasks/batch.rake'
  end

  it 'makes sure `runner` statements exist' do
    schedule = Whenever::Test::Schedule.new(file: 'config/schedule.rb')
    assert_equal 2, schedule.jobs[:rake].count
  end

  it 'makes sure `rake`cron jobs test cases statements exist' do
    schedule = Whenever::Test::Schedule.new(vars: { environment: '' })

    # Makes sure the rake task is defined:
    assert Rake::Task.task_defined?(schedule.jobs[:rake].first[:task])
  end

end