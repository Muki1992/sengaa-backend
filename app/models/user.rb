class User < ApplicationRecord
  include Filterable
  has_secure_token :auth_token
  after_create :set_score

  validates :email, :username, uniqueness: true, presence: true

  has_many :style
  has_many :comment
  has_many :user_actions
  has_many :membership
  has_many :team

  has_many :given_wows,
           foreign_key: 'user_id', class_name: 'Wow'

  has_many :followings_info,
           foreign_key: 'followed_user_id', class_name: 'Following'
  has_many :followers_info, foreign_key: 'following_user_id', class_name: 'Following'

  has_many :followings, through: :followings_info, source: :following_user
  has_many :followers, through: :followers_info, source: :followed_user

  has_many :challenge, through: :style

  has_many :awards, through: :style

  has_one :point

  scope :username, ->(username) {where 'lower(username) LIKE lower(?) ', "%#{username}%"}

  def set_auth_info(_params)
    puts title + ', Old State: ' + state if state
    self.state = check_state
    puts title + ', New State: ' + state
  end

  def self.find_user_by(value)
    where(['username = :value OR email = :value', {value: value}]).first
  end

  def generate_login_token
    self.login_token = SecureRandom.hex(3)
    self.token_generated = Time.now.utc
    save!
  end

  def login_token_expired?
    Time.now.utc > (token_generated + token_validity)
  end

  def token_validity
    2.hours
  end

  def set_score
    point = Point.create(user: self)
  end

end
