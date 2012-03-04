class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.for_project current_project
  end

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.new(params[:milestone])
    @milestone.project = current_project

    if @milestone.save
      redirect_to project_milestones_url
    else
      render :new
    end
  end
end
