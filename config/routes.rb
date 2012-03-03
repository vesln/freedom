Freedom::Application.routes.draw do
  resource :dashboard

  scope :module => 'authentication' do
    resource :registration, :only => [:new, :create]
    resources :sessions, :only => [:new, :create, :destroy]
  end
end
