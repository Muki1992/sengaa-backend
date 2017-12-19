class BaseApiController < ActionController::Base
  #include ApiSecured

  def ping
    render json: "All good. You only get this message if you're authenticated."
  end

  def track_action
    @user_action = UserAction.new
    @user_action.action_type = controller_name + ':' + action_name
    case @user_action.action_type
      when 'wows:create'
        #@user_action.user_id = @wow.user_id
        @user_action.wow_id = @wow.id
      when 'followings:create'
        #@user_action.user_id = @following.following_user_id
        @user_action.following_id = @following.id
    end
    @user_action.save
  end

end
