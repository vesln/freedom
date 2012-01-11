Freedom::Application.routes.draw do
  resources :users
  
  get "dashboards/index"
  
  devise_for :user
  
  root :to => 'dashboards#index'
end
