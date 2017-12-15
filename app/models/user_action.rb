class UserAction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :comment, optional: true
  belongs_to :style, optional: true
  belongs_to :wow, optional: true
  belongs_to :following, optional: true

end
