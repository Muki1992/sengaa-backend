Rails.application.routes.draw do

  root 'static#home'

  apipie
  get 'home/index'

  get "/pages/:page" => "pages#show"
  get "/logout" => "pages#logout"


  # Auth0
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"


  # BoController
  resources :bo_events,
            :categories,
            :partners,
            :prize_contents,
            :bo_challenges,
            :bo_prizes

  namespace :backoffice do
    resources :partners
  end

  namespace :api, defaults: {format: :json} do

    get 'request/token' => 'authentication#send_login_token'
    get 'login' => 'authentication#login'
    post 'register' => 'authentication#register'

    resources :styles,
              :followings,
              :wows,
              :comments,
              :rankings,
              :deals,
              :teams,
              :memberships,
              :team_requests,
              :awards,
              :points
    namespace :challenges do
      resources :single_challenges, path: 'singles'
      resources :team_challenges, path: 'teams'
      resources :styles
    end

    resources :users do
      resources :styles
      resources :memberships
      resources :awards
    end

    resources :teams do
      resources :memberships
      resources :team_requests
    end
  end

end
