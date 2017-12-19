class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :score, default: 0
      t.string :auth_id
      t.timestamps
    end
  end
end
