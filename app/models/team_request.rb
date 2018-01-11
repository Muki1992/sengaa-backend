class TeamRequest < ApplicationRecord
  include Filterable

  before_save :check_team
  after_save :create_membership

  belongs_to :user
  belongs_to :team

  has_many :membership, through: :team

  def check_team
    self.status = 'accepted' if team.public?
  end

  def create_membership
    Membership.new(user_id: user.id, team_id: team.id, role: 'Member').save if status == 'accepted'
  end

  scope :team_id, -> (team_id) {where team_id: team_id}

end
