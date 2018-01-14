class Team < ApplicationRecord
  include Filterable
  after_create :create_ownership

  belongs_to :user
  has_many :membership, dependent: :destroy
  has_many :team_requests, dependent: :destroy

  def create_ownership
    membership = Membership.new(user_id: user_id, team_id: id, role: 'owner')
    self.membership << membership
  end
end
