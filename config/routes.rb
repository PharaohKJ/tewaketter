Rails.application.routes.draw do
  resources :templates
  # resources :invite_codes
  resources :tags
  resources :configs
  resources :tweets do
    collection do
      post 'all/:user_id/:to_id', to: 'tweets#all', as: 'tweets_all'
    end
  end
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/invite', to: 'sessions#invite', as: :invite
  get '/signout', to: 'sessions#destroy'
end
