class CreateStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :styles do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.integer :count_of_comments, default: 0
      t.integer :count_of_wows, default: 0

      t.timestamps
    end
  end
end
