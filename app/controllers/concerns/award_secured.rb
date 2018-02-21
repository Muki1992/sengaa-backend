module Concerns::AwardSecured
  extend ActiveSupport::Concern

  def check_authorization_of_current_user(user_id)
    if @current_user.id == Integer(user_id.to_i)
      true
    else
      render json: {errors: ['Not your awards']}, status: 400
      false
    end
  end
end