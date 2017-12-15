class Comment < ApplicationRecord
  belongs_to :style
  belongs_to :user
  has_many :user_actions

end
