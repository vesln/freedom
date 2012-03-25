#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class CommentsController < ApplicationController
  def create
    @comment = current_task.comments.new(params[:comment])
    @comment.save
    redirect_to project_task_url(current_project, current_task)
  end

  private

  def current_task
    @current_task ||= current_project.tasks.find(params[:task_id])
  end
end
