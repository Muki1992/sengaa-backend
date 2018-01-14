class TeamChallengeStage < ApplicationRecord
  before_save :set_state, unless: :state

  belongs_to :challenge
  belongs_to :team, foreign_key: 'winning_team_id', optional: true

  def set_state
    new_state = check_state
    puts title + ', Old State: ' + state + ', New State: ' + new_state if state
    self.state = new_state
  end

  def check_state
    if self.end > Time.now
      'not finished'
    else
      'finished'
    end
  end
end
