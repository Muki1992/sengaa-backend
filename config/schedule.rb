set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}
set :environment, "production"

every 1.minutes do
  puts "Running update_states task"
  rake "challenges:update_states"
end

