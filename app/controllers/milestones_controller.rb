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

  def edit
    @milestone = Milestone.find(params[:id])
  end

  def update
    @milestone = Milestone.find_by_id_and_project_id(params[:id], current_project.id)

    if @milestone.update_attributes(params[:milestone])
      redirect_to project_milestones_url
    else
      render :edit
    end
  end
end
