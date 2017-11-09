Rails.application.routes.draw do


  get "/pages/:page" => "pages#show"

  # Auth0
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  Rails.application.routes.draw do
    namespace :api, :defaults => {:format => :json} do

    end
  end

end
