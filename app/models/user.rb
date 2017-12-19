class User < ApplicationRecord
  include Filterable

  has_many :style
  has_many :comment
  has_many :user_actions

  has_many :given_wows,
           foreign_key: 'user_id', class_name: 'Wow'

  has_many :followings_info,
           foreign_key: 'followed_user_id', class_name: 'Following'
  has_many :followers_info, foreign_key: 'following_user_id', class_name: 'Following'

  has_many :followings, through: :followings_info, source: :following_user
  has_many :followers, through: :followers_info, source: :followed_user

  has_many :challenge, through: :style

  scope :username, -> (username) {where 'lower(username) LIKE lower(?) ', "%#{username}%"}

  def set_auth_info(params)
    puts title + ', Old State: ' + state if state
    self.state = check_state
    puts title + ', New State: ' + state
  end

end
