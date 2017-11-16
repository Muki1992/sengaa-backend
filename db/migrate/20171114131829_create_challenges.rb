class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.integer :gender
      t.references :category, foreign_key: true
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
