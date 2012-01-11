Freedom::Application.routes.draw do
  # Resources.
  resources :projects
  resources :users
  
  # Devise gem.
  devise_for :user
  
  # Home.
  root :to => 'dashboards#index'
end
