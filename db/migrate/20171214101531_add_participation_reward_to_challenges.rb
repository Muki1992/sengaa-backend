class AddParticipationRewardToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_reference :challenges, :participation_reward, foreign_key: true
  end
end
