class ParticipationReward < ApplicationRecord
  belongs_to :partner
  has_one :challenge
end
