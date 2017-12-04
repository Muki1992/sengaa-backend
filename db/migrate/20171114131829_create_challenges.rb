class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.integer :gender
      t.references :category, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.integer :state
      t.timestamps null: false
    end
  end
end
