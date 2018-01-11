class Team < ApplicationRecord
  include Filterable
  after_create :create_ownership

  belongs_to :user
  has_many :membership

  def create_ownership
    membership = Membership.new(user_id: user_id, team_id: id, role: 'Owner')
    self.membership << membership
  end

end
