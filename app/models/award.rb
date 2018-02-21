class Award < ApplicationRecord
  include Filterable

  belongs_to :partner, optional: true
  belongs_to :challenge, optional: true
  belongs_to :style, optional: true


  delegate :user, :to => :style, :allow_nil => true

  scope :user_id, ->(user_id) {includes(:style).where(styles: {user_id: user_id})}
end
