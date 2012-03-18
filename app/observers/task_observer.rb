#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class TaskObserver < ActiveRecord::Observer
  def after_create(task)
    update_completed_counter_cache(task)
  end

  def after_destroy(task)
    update_completed_counter_cache(task)
  end

  def after_update(task)
    update_completed_counter_cache(task)
  end

  private

  def update_completed_counter_cache(task)
    return unless task.milestone
    task.milestone.completed_tasks_count = count_for(task.milestone)
    task.milestone.save
  end

  def count_for(milestone)
    milestone.tasks.completed.count
  end
end
