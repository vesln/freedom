Freedom::Application.routes.draw do
  get "dashboards/index"

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end
  
  root :to => 'dashboards#index'
end
