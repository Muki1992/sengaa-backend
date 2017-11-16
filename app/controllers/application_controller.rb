class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :current_bo_user

  def current_bo_user
    if @boUser
    else
      @boUser = BoUser.new
      @boUser.email = session[:userinfo]['info']['email']
      @boUser.nickname = session[:userinfo]['info']['nickname']
      @boUser.name = session[:userinfo]['info']['name']
    end
  end

  helper_method :current_bo_user


end
