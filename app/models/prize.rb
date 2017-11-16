class Prize < ApplicationRecord
  belongs_to :prize_content
  belongs_to :challenge
end
