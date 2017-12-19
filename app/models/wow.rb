class Wow < ApplicationRecord
  belongs_to :user
  belongs_to :style, counter_cache: :count_of_wows

  has_many :user_actions
end
