class Api::ChallengesController < BaseApiController

  def index
    @challenges = Challenge.all
    render json: @challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
