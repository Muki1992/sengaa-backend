class Style < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :wows
  has_many :wowing_users, through: :wows, source: :user

  has_many :user_actions

end
