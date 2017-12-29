class Challenge < ApplicationRecord
  include Filterable
  before_save :set_state, unless: :state

  belongs_to :category
  has_many :awards
  has_many :styles
  belongs_to :participation_reward

  enum gender: %i[every female male]
  enum state: %i[created active finished]

  scope :challenge_id, -> (id) {where id: id}
  scope :category_id, ->(category_id) {where category_id: category_id}
  scope :gender, ->(gender) {where gender: gender}
  scope :state, ->(state) {where state: state}

  def set_state
    new_state = check_state
    puts title + ', Old State: ' + state + ', New State: ' + Challenge.states.key(new_state) if state
    self.state = new_state
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
