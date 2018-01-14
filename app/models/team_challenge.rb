class TeamChallenge < Challenge
  include Filterable

  has_many :team_challenge_stages, foreign_key: 'winning_team_id', class_name: 'TeamChallengeStage'

end
