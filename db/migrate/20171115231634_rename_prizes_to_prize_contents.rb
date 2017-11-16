class RenamePrizesToPrizeContents < ActiveRecord::Migration[5.1]
  def change
    rename_table :prizes, :prize_contents
  end
end
