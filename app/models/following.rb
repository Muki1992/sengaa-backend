class Following < ApplicationRecord
  belongs_to :following_user,
             class_name: 'User', foreign_key: 'following_user_id'
  belongs_to :followed_user,
             class_name: 'User', foreign_key: 'followed_user_id'

  has_many :user_actions

end
