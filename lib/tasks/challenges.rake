namespace :challenges do
  desc "Updates the state of the challenges"
  task update_states: :environment do
    puts "Updating states"
    Challenge.all.each do |challenge|
      challenge.set_state
      challenge.save
    end
  end

end