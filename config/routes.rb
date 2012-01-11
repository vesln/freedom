Freedom::Application.routes.draw do
  devise_for :users
  root :to => 'dashboards#index'
end
