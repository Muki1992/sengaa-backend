Rails.application.routes.draw do


  get 'home/index'

  get "/pages/:page" => "pages#show"
  get "/logout" => "pages#logout"


  # Auth0
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"

  # BoController
  resources :bo_events
  resources :categories
  resources :partners
  resources :prize_contents
  resources :bo_challenges
  resources :bo_prizes

  namespace :backoffice do
    resources :partners
  end

  namespace :api, defaults: {format: :json} do
    resources :challenges
    resources :users
    resources :styles
    resources :followings
    resources :wows
    resources :comments
    resources :rankings
    resources :deals
  end

end
