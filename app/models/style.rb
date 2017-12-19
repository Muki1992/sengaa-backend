class Style < ApplicationRecord
  include Filterable

  belongs_to :user
  belongs_to :challenge
  has_one :award
  has_many :comments

  has_many :wows
  has_many :wowing_users, through: :wows, source: :user

  has_many :user_actions

  scope :id, -> (id) {where id: id}
  scope :challenge_id, -> (challenge_id) {where challenge_id: challenge_id}
  scope :user_id, -> (user_id) {where user_id: user_id}

end
