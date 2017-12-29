class Api::ChallengesController < BaseApiController

  def index
    @challenges = Challenge.paginate(page: params[:page], per_page: 10)
    UserManagementTokenService.new
    render json: @challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
