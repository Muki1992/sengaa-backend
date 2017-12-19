class Comment < ApplicationRecord
  belongs_to :style, counter_cache: :count_of_comments
  belongs_to :user
  has_many :user_actions

end
