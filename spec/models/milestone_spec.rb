#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe Milestone do
  it { should allow_mass_assignment_of(:name) }
  it { should_not allow_mass_assignment_of(:project_id) }

  it { should belong_to(:project) }
  it { should have_many(:tasks) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:project_id) }

  it "has many completed tasks" do
    milestone = create(:milestone)
    create(:task, :milestone => milestone, :project_id => milestone.project_id)
    completed = create(:completed_task, :milestone => milestone, :project_id => milestone.project_id)
    milestone.reload.completed_tasks.all.should == [completed]
  end
end
