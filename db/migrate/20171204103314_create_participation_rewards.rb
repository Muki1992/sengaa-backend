class CreateParticipationRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :participation_rewards do |t|
      t.string :title
      t.string :description
      t.date :valid_until
      t.string :code
      t.references :partner, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :amount
      t.integer :distributed_amount

      t.timestamps
    end
  end
end
