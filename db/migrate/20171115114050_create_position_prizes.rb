class CreatePositionPrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :position_prizes do |t|
      t.integer :position
      t.references :prize, foreign_key: true

      t.timestamps
    end
  end
end
