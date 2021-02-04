# Use this file to easily define all of your cron jobs.
set :environment, "development"
set :output, "log/cron.log"
env :PATH, '/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'


# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day, at: '11:00 am' do
    rake 'batch:send_messages'
end
every 2.minutes do
    rake 'batch:send_messages'
end
  
# whenever --update-crontab
# crontab -l
