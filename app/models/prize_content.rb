class PrizeContent < ApplicationRecord
  belongs_to :partner
  has_many :prizes
end
