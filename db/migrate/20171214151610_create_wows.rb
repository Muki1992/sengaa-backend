class CreateWows < ActiveRecord::Migration[5.1]
  def change
    create_table :wows do |t|
      t.integer :user_id
      t.integer :style_id
      t.timestamps
    end
  end
end
