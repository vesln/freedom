# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery
end
