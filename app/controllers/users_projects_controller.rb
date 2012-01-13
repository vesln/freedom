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

class UsersProjectsController < ApplicationController
  
  # All controller actions require admin role.
  before_filter :authorize_admin!
  
  def index
    @users = User.in_project(current_project.id)

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @users_project = UsersProject.new

    respond_to do |format|
      format.html
      format.json { render json: @users_project }
    end
  end

  def edit
    @users_project = UsersProject.find(params[:id])
  end

  def create
    @users_project = UsersProject.new(params[:users_project])
    @users_project.project = current_project

    respond_to do |format|
      if @users_project.save
        format.html { redirect_to project_users_projects_url(current_project), notice: 'Users project was successfully created.' }
        format.json { render json: @users_project, status: :created, location: @users_project }
      else
        format.html { render action: "new" }
        format.json { render json: @users_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @users_project = UsersProject.find(params[:id])

    respond_to do |format|
      if @users_project.update_attributes(params[:users_project])
        format.html { redirect_to project_users_projects_url(current_project), notice: 'Users project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @users_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @users_project = UsersProject.find(params[:id])
    @users_project.destroy

    respond_to do |format|
      format.html { redirect_to project_users_projects_url(current_project) }
      format.json { head :ok }
    end
  end
end
