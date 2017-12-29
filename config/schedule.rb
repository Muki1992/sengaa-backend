set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :environment, "development"

every 30.minutes do
  puts "Running update_states task"
  rake "challenges:update_states"
end

