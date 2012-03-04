Freedom::Application.routes.draw do
  resource :dashboard

  resources :projects do
    resources :milestones
  end

  scope :module => 'authentication' do
    resource :registration, :only => [:new, :create]
    resources :sessions, :only => [:new, :create, :destroy]
  end

  get '/backdoor-login', :to => 'backdoor_login#login' if Rails.env.test?
end
