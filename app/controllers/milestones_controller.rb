# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class MilestonesController < ApplicationController
  
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
        format.html { redirect_to project_milestone_url(current_project, @milestone), notice: 'Milestone was successfully created.' }
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
        format.html { redirect_to project_milestone_url(current_project, @milestone), notice: 'Milestone was successfully updated.' }
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
