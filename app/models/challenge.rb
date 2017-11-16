class Challenge < ApplicationRecord
  belongs_to :category
  has_many :prizes
  enum gender: [:every, :female, :male]

end
