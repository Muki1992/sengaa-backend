module Api::Challenges

  class SingleChallengesController < BaseApiController

    api :GET, "/challenges/singles", "Get all single challenges"
    param :page, :number
    def index
      @single_challenges = SingleChallenge.filter(params.slice(:challenge_id)).paginate(page: params[:page], per_page: 10)
      #UserManagementTokenService.new
      render json: @single_challenges
    end


    def show
      @single_challenge = SingleChallenge.find(params[:id])
      render json: @single_challenge
    end
  end
end
