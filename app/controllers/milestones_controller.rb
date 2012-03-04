class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.for_project current_project
  end
end
