class CreateTeamRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :team_requests do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.string :status, default: 'sent'
      t.timestamps
    end
  end
end
