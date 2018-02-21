class Api::PointsController < BaseApiController

  def index
    @point = @current_user.point
    render json: @point,
           except: %i[created_at updated_at]
  end
end
