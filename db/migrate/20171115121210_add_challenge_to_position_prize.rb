class AddChallengeToPositionPrize < ActiveRecord::Migration[5.1]
  def change
    add_reference :position_prizes, :challenge, foreign_key: true
  end
end
