class Api::AwardsController < BaseApiController

  def index
    @awards = Award.filter(params.slice(:challenge_id)).paginate(page: params[:page], per_page: 10)
    render json: @awards, include: {style: {}}
  end

  def show
    @single_challenge = SingleChallenge.find(params[:id])
    render json: @single_challenge
  end
end
