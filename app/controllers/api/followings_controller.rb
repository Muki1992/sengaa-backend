class Api::FollowingsController < BaseApiController

  def create
    @following = Following.new(following_params)
    if @following.save
      track_action
      render json: @following
    end
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    render json: @following
  end

  def following_params
    params.require(:following).permit(:following_user_id, :followed_user_id)
  end
end
