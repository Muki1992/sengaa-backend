class CreateUserActions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_actions do |t|
      t.string :action_type
      t.references :user, foreign_key: true
      t.references :style, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :wow, foreign_key: true
      t.references :following, foreign_key: true
      t.timestamps
    end
  end
end
