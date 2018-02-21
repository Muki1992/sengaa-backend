class Api::Challenges::TeamChallengesController < BaseApiController
  api :GET, '/challenges/teams', 'Get all team challenges'
  param :page, :number
  def index
    @team_challenges = TeamChallenge.paginate(page: params[:page], per_page: 10)
    # UserManagementTokenService.new
    render json: @team_challenges
  end

  api :GET, '/challenges/teams/:id', 'Get a team challenge by its id'
  param :id, Integer, required: true
  def show
    @team_challenge = SingleChallenge.find(params[:id])
    render json: @team_challenge
  end
end
