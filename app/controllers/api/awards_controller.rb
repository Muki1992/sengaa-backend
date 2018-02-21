class Api::AwardsController < BaseApiController
  include Concerns::AwardSecured

  api :GET, '/user/:user_id/awards', 'Get all awards that have been distributed'
  param :page, Integer
  def index
    if check_authorization_of_current_user(params[:user_id])
      @awards = Award.filter(params.slice(:challenge_id, :user_id)).paginate(page: params[:page], per_page: 15)
      render json: @awards, include: {style: {}}
    end

  end

  def show
    @single_challenge = SingleChallenge.find(params[:id])
    render json: @single_challenge
  end
end
