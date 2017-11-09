class Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = request.env['omniauth.auth']

    # Redirect to the URL you want after successful auth
    redirect_to '/pages/home'
  end

  def failure
    render file: "public/404.html", status: :not_found
  end
end
