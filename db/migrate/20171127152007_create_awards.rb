class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      t.string :title
      t.string :description
      t.date :valid_until
      t.string :code
      t.references :partner, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :level
      t.date :user_notified_at
      t.timestamps
    end
  end
end
