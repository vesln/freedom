Freedom::Application.routes.draw do
  resource :dashboard
  resource :account

  resources :projects do
    resources :milestones
  end

  scope :module => 'authentication' do
    get 'sign_up', :to => 'registrations#new', :as => 'sign_up'
    post 'sign_up', :to => 'registrations#create', :as => 'sign_up'
    resources :user_sessions, :only => [:new, :create, :destroy]
  end

  get '/backdoor-login', :to => 'backdoor_login#login' if Rails.env.test?
end
