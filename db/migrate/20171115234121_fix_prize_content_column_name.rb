class FixPrizeContentColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :prizes, :prize_id, :prize_content_id
  end
end
