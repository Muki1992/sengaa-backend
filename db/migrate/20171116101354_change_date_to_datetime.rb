class ChangeDateToDatetime < ActiveRecord::Migration[5.1]
  def change
    change_column :challenges, :start, :datetime
    change_column :challenges, :end, :datetime
  end
end
