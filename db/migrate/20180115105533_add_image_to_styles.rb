class AddImageToStyles < ActiveRecord::Migration[5.1]
  def change
    add_column :styles, :image, :string
  end
end
