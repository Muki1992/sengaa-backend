class Award < ApplicationRecord
  belongs_to :partner
  belongs_to :challenge
end
