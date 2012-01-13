#--
# Freedom - Mind-blowing issue tracker.
#
# Copyright (c) 2012 Veselin Todorov <hi@vesln.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

# ApplicationController is base class for all controllers in the app.
# This gives you one class to configure things such as request forgery protection, 
# authentication and  filtering of sensitive request parameters.
class ApplicationController < ActionController::Base
  
  # The passed filters will be appended to the filter_chain and will execute 
  # before the action on this controller is performed.
  before_filter :authenticate_user!
  
  # Methods used in the controller and the templates.
  helper_method :current_project, :can_manage_project
  
  # Turn on request forgery protection.
  protect_from_forgery
  
  # Protected methods.
  protected
  
  # Checks if current user is admin.
  # If he's not it will redirect him to the root url.
  def authorize_admin!
    handle_unauthorized unless current_user.is_admin?
  end
  
  # Returns the current project.
  # Also, note that the project is cached in a var.
  def current_project
    @current_project ||= Project.find_by_id(params[:project_id])
  end
  
  # Authorizes users with level of admin or project moderators.
  def authorize_admin_or_project_moderator!
    if !current_user.can_moderate?(current_project.id)
      handle_unauthorized
    end
  end
  
  # Handles unauthorized users.
  def handle_unauthorized
    redirect_to('/')
  end
  
end
