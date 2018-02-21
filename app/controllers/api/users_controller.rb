class Api::UsersController < BaseApiController
  api :GET, '/challenges/singles/:id', 'Get a single challenge by its id'
  param :id, Integer
  param :page, Integer

  def index
    @users = User.filter(params.slice(:username)).paginate(page: params[:page], per_page: 10)
    render json: @users, except: %i[auth_id created_at updated_at]
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: {followings: {},
                                  followers: {}},
           except: %i[created_at updated_at auth_token login_token token_generated awards]
  end

  def create
    @user = User.new(user_params)

    UserMailer.welcome_email(@user).deliver
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :first_name, :family_name, :gender, :birthdate)
  end

end
