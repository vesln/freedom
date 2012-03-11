class TasksController < ApplicationController
  def index
    @tasks = current_project.tasks.all
  end
end
