class Api::UsersController < BaseApiController
  def index
    @users = User.all
    render json: @users, except: %i[created_at updated_at]
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: {followings: {},
                                  followers: {}},
           except: %i[created_at updated_at]
  end
end
