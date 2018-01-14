class Membership < ApplicationRecord
  include Filterable

  belongs_to :team, optional: true
  belongs_to :user, optional: true

  scope :team_id, -> (team_id) {where team_id: team_id}
  scope :user_id, -> (user_id) {where user_id: user_id}
  scope :role, -> (role) {where role: role}


end
