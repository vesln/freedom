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

class User < ActiveRecord::Base
  
  # Associations.
  has_many :users_projects, :dependent => :destroy
  has_many :projects, :through => :users_projects
  
  # Devise configurations.
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for the model.
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :name
  
  # Scope.
  scope :not_in_project, lambda { |project_id| 
    joins('LEFT JOIN `users_projects` ON `users_projects`.`user_id` = `users`.`id`')
    .where("`users_projects`.`project_id` != ? OR `users_projects`.`project_id` IS NULL", project_id) 
  }
  
  # Checks if user is admin.
  def is_admin?
    admin
  end
  
  # Checks if user is moderator for supplied project.
  def can_moderate?(project_id)
    return true if is_admin?
    UsersProject.where(:user_id => id, :project_id => project_id, :access => Project::MODERATOR).exists?
  end
  
  # Checks if user has access to supplied project.
  def has_access_to(project_id)
    return true if is_admin?
    UsersProject.where(:user_id => id, :project_id => project_id).exists?
  end
  
end
