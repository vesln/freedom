Freedom::Application.routes.draw do
  scope :module => 'authentication' do
    resource :registration, :only => [:new, :create]
  end
end
