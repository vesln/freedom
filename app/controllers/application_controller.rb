# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

# ApplicationController is base class for all controllers in the app.
# This gives you one class to configure things such as request forgery protection, 
# authentication and  filtering of sensitive request parameters.
class ApplicationController < ActionController::Base
  
  # The passed filters will be appended to the filter_chain and will execute 
  # before the action on this controller is performed.
  before_filter :authenticate_user!
  
  # Methods used in the controller and the templates.
  helper_method :current_project
  
  # Turn on request forgery protection.
  protect_from_forgery
  
  # Protected methods.
  protected
  
  # Checks if current user is admin.
  # If he's not it will redirect him to the root url.
  def authenticate_admin!
    redirect_to('/') unless current_user.is_admin?
  end
  
  # Returns the current project.
  # Also, note that the project is cached in a var.
  def current_project
    @current_project ||= Project.find_by_id(params[:project_id])
  end
end
