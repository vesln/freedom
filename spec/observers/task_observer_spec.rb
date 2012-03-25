#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe TaskObserver do
  it "updates counter cache for milestone when completed" do
    ActiveRecord::Observer.with_observers(:task_observer) do
      milestone = create(:milestone)
      build(:completed_task, :milestone => milestone).save!
      build(:task, :milestone => milestone).save!
      task = create(:task, :milestone => milestone)
      task.state = Task::COMPLETED.first
      task.save!
      milestone.reload.completed_tasks_count.should == 2
    end
  end
end
