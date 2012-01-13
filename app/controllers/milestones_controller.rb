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

class MilestonesController < ApplicationController
  
  # All controller actions require admin role.
  before_filter :authorize_admin_or_project_moderator!
  
  def index
    @milestones = Milestone.all

    respond_to do |format|
      format.html
      format.json { render json: @milestones }
    end
  end

  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @milestone }
    end
  end

  def new
    @milestone = Milestone.new

    respond_to do |format|
      format.html
      format.json { render json: @milestone }
    end
  end

  def edit
    @milestone = Milestone.find(params[:id])
  end

  def create
    @milestone = Milestone.new(params[:milestone])
    @milestone.project = current_project

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to [current_project, @milestone], notice: 'Milestone was successfully created.' }
        format.json { render json: @milestone, status: :created, location: @milestone }
      else
        format.html { render action: "new" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to [current_project, @milestone], notice: 'Milestone was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to project_milestones_url }
      format.json { head :ok }
    end
  end
end
