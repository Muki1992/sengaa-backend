class Challenge < ApplicationRecord
  include Filterable
  before_save :set_state, unless: :state

  scope :single_challenges, -> {where(type: 'SingleChallenge')}

  belongs_to :category
  has_many :awards
  has_many :styles
  belongs_to :participation_reward

  def set_state
    new_state = check_state
    puts title + ', Old State: ' + state + ', New State: ' + new_state if state
    self.state = new_state
  end

  def check_state
    if start > Time.now
      'created'
    elsif (start..self.end).cover?(Time.now)
      'active'
    else
      'finished'
    end
  end

end
