Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root 'pages#index'

  namespace :v1 do
    jsonapi_resources :organizations
    # jsonapi_resources :users
  end # namespace :v1
end
