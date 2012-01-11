# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

Freedom::Application.routes.draw do
  
  # Accounts
  get "account" => 'accounts#edit'
  put "account" => 'accounts#update'

  # Resources.
  resources :projects
  resources :users
  
  # Devise gem.
  devise_for :user
  
  # Home.
  root :to => 'dashboards#index'
end
