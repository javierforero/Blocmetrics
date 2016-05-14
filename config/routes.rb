Rails.application.routes.draw do

  root 'welcome#index'
  devise_for :users
  resources :users, only:[:show] do
    resources :registered_apps
  end

end
