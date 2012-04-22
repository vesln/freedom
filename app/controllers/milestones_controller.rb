#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class MilestonesController < ApplicationController
  def index
    @milestones = current_project.milestones.all
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = current_project.milestones.new params[:milestone]

    if @milestone.save
      redirect_to project_milestones_url
    else
      render :new
    end
  end

  def edit
    @milestone = current_project.milestones.find params[:id]
  end

  def update
    @milestone = current_project.milestones.find params[:id]

    if @milestone.update_attributes params[:milestone]
      redirect_to project_milestones_url
    else
      render :edit
    end
  end

  def destroy
    @milestone = current_project.milestones.find params[:id]
    @milestone.destroy
    redirect_to project_milestones_url
  end
end
