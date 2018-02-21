class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.references :user, foreign_key: true
      t.string :rank
      t.integer :score, default: 0
      t.integer :style_score, default: 0
      t.integer :wow_score, default: 0

      t.timestamps
    end
  end
end
