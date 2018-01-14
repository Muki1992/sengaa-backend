class CreateTeamChallengeStages < ActiveRecord::Migration[5.1]
  def change
    create_table :team_challenge_stages do |t|
      t.references :challenge, foreign_key: true
      t.datetime :end
      t.string :state
      t.integer :bonus
      t.string :image
      t.integer :winning_team_id

      t.timestamps
    end
  end
end
