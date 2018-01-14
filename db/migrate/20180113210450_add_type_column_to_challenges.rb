class AddTypeColumnToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :type, :string
  end
end
