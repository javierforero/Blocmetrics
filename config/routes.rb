Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users
  resources :users, only:[:show] do
    resources :registered_apps
  end

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

end
