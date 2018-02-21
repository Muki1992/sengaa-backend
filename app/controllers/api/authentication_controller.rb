class Api::AuthenticationController < ActionController::Base

  def send_login_token
    user = User.find_user_by(request.headers[:value])
    if user
      user.generate_login_token
      UserMailer.login_token(user).deliver
      render json: {success: 'We have sent you an email'}, status: 200
    else
      render json: {error: 'There is no user corresponding to the entered username or email.' }, status: 400
    end
  end

  def login
    user = User.find_user_by(request.headers[:value])
    if user.login_token.to_s == request.headers[:code].to_s
      if !user.login_token_expired?
        render json: user, status: 200
      else
        render json: {error: 'Token expired.'}, status: 400
      end
    else
      render json: {error: 'Code incorrect. '}, status: 400
    end
  end

  def register
    user = User.new(user_params)
    if user.save
      UserMailer.login_token(user).deliver
      render json: {success: 'Created account. We have sent you an email'}, status: 200
    else
      render json: {error: user.errors.full_messages.first}, status: 400
    end

  end


private

def user_params
  params.require(:user).permit(:email, :username, :first_name, :family_name, :gender, :birthdate)
end


end
