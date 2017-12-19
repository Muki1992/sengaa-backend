class Award < ApplicationRecord
  include Filterable

  belongs_to :partner, optional: true
  belongs_to :challenge, optional: true
  belongs_to :style, optional: true

  scope :user_id, -> (user_id) {where user_id: user_id}

end
