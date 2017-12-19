class Api::ChallengesController < BaseApiController

  def index
    @challenges = Challenge.paginate(page: params[:page], per_page: 10)
    #UserInfoService.new({auth_header_value: 'Bearer Nev3BEsXxdq002eLkm7nAK1MZYBdUMTV'})
    render json: @challenges
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
