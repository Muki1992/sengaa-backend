class CreatePrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :prizes do |t|
      t.string :title
      t.string :description
      t.string :code
      t.references :partner, foreign_key: true

      t.timestamps
    end
  end
end
