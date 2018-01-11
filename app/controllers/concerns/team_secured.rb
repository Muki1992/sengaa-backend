module TeamSecured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user_role!
  end

  private

  def authenticate_request!
    result = auth_token
    @current_user = User.find_by_auth_id(result[0]['sub'])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: {errors: ['Not Authenticated']}, status: :unauthorized
  end

  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    JsonWebToken.verify(http_token)
  end
end