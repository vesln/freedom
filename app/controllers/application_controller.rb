# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  protect_from_forgery
  
  protected
  
  def authenticate_admin!
    redirect_back_or_default('/') unless current_user.is_admin?
  end
end
