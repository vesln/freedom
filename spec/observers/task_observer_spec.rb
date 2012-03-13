#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

describe TaskObserver do
  it "updates counter cache for milestone when completed" do
    milestone = create(:milestone)
    build(:completed_task, :milestone => milestone).save!
    build(:task, :milestone => milestone).save!
    task = create(:task, :milestone => milestone)
    task.state = Task::COMPLETED.first
    task.save!
    milestone.reload.completed_tasks_count.should == 2
  end
end
