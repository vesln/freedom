Freedom::Application.routes.draw do
  get "dashboards/index"

  devise_for :users
  root :to => 'dashboards#index'
end
