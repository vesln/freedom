#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :logged_in?, :current_user_session, :current_user
  helper_method :current_project

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.record
  end

  def logged_in?
    !!current_user
  end

  def current_project
    @current_project ||= Project.find params[:project_id]
  end
end
