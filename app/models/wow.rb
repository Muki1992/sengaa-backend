class Wow < ApplicationRecord
  belongs_to :user
  belongs_to :style

  has_many :user_actions
end
