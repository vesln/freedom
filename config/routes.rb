Freedom::Application.routes.draw do
  get "dashboards/index"
  devise_for :user
  root :to => 'dashboards#index'
end
