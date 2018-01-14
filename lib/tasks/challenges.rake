namespace :challenges do
  desc "Updates the state of the challenges"
  task update_states: :environment do
    puts 'Updating states'
    challenges = Challenge.where.not(state: 'finished')
    puts 'Number of not started and active challenges: ' + challenges.length.to_s
    challenges.each do |challenge|
      challenge.set_state
      challenge.save
    end
  end

end