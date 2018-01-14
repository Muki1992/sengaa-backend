class Api::Challenges::SingleChallengesController < BaseApiController

  def index
    @single_challenges = SingleChallenge.paginate(page: params[:page], per_page: 10)
    #UserManagementTokenService.new
    render json: @single_challenges
  end

  def show
    @single_challenge = SingleChallenge.find(params[:id])
    render json: @single_challenge
  end
end
