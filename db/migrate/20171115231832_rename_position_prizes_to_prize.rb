class RenamePositionPrizesToPrize < ActiveRecord::Migration[5.1]
  def change
    rename_table :position_prizes, :prizes
  end
end
