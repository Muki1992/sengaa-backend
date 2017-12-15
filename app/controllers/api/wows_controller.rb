class Api::WowsController < BaseApiController

  def create
    @wow = Wow.new(wow_params)
    if @wow.save
      track_action
      render json: @wow
    end
  end

  def wow_params
    params.require(:wow).permit(:user_id, :style_id)
  end
end
