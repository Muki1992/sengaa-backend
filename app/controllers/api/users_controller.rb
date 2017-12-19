class Api::UsersController < BaseApiController
  def index
    @users = User.filter(params.slice(:username)).paginate(page: params[:page], per_page: 10)
    render json: @users, except: %i[auth_id created_at updated_at]
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: { followings: {},
                                   followers: {} },
           except: %i[created_at updated_at]
  end
end
