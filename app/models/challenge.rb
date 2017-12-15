class Challenge < ApplicationRecord
  before_save :set_state, unless: :state

  belongs_to :category
  has_many :awards
  belongs_to :participation_reward

  enum gender: %i[every female male]
  enum state: %i[created active finished]

  def set_state
    puts title + ', Old State: ' + state if state
    self.state = check_state
    puts title + ', New State: ' + state
  end

  def check_state
    if start > Time.now
      0
    elsif (start..self.end).cover?(Time.now)
      1
    else
      2
    end
  end
end
