#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class TasksController < ApplicationController
  def index
    @tasks = current_project.tasks.opened
    @completed = current_project.tasks.completed.paginate(paging_params)
  end

  def new
    @task = current_project.tasks.new
  end

  def create
    @task = current_project.tasks.new(params[:task])
    @task.user = current_user

    if @task.save
      redirect_to project_task_url(current_project, @task)
    else
      render 'new'
    end
  end

  def show
    @task = current_project.tasks.find(params[:id])
    @comment = Comment.new
  end

  private

  def paging_params
    {:page => params[:page], :per_page => 15}
  end
end
