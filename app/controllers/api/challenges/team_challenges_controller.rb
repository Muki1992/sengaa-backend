class Api::Challenges::TeamChallengesController < BaseApiController

  def index
    @team_challenges = TeamChallenge.paginate(page: params[:page], per_page: 10)
    #UserManagementTokenService.new
    render json: @team_challenges
  end

  def show
    @team_challenge = SingleChallenge.find(params[:id])
    render json: @team_challenge
  end
end
