class AddStyleReferenceToAward < ActiveRecord::Migration[5.1]
  def change
    add_reference :awards, :style, foreign_key: true
  end
end
