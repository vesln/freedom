# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

Freedom::Application.routes.draw do
  
  # Account.
  get "account" => 'accounts#edit'
  put "account" => 'accounts#update'

  # Resources.
  resources :projects do
    resources :milestones
  end
  resources :users
  
  # Devise gem. 
  # Handles sign in and sign out.
  devise_for :user
  
  # Home.
  root :to => 'dashboards#index'
end
