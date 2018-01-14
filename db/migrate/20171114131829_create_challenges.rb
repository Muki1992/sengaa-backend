class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.string :gender
      t.references :category, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.string :state
      t.timestamps null: false
    end
  end
end
