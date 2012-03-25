#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

Freedom::Application.routes.draw do
  resource :dashboard
  resource :account

  resources :projects do
    resources :milestones

    resources :tasks do
      resources :comments
    end
  end

  scope :module => 'authentication' do
    get  'sign_up', :to => 'registrations#new',    :as => 'sign_up'
    post 'sign_up', :to => 'registrations#create', :as => 'sign_up'

    get  'sign_in', :to => 'user_sessions#new',    :as => 'sign_in'
    post 'sign_in', :to => 'user_sessions#create', :as => 'sign_in'

    delete 'sign_out', :to => 'user_sessions#destroy', :as => 'sign_out'
  end

  root :to => 'authentication::user_sessions#new'
end
