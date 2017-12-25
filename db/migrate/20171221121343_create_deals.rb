class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.references :partner, foreign_key: true
      t.string :link
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
