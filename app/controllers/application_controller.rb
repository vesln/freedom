# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  
  helper_method :current_project
  
  protect_from_forgery
  
  protected
  
  def authenticate_admin!
    redirect_to('/') unless current_user.is_admin?
  end
  
  def current_project
    @current_project ||= Project.find_by_id(params[:project_id])
  end
end
