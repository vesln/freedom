Freedom::Application.routes.draw do
  resource :dashboard

  scope :module => 'authentication' do
    resource :registration, :only => [:new, :create]
    resource :session, :only => [:new, :create, :destroy]
  end
end
