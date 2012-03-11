#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe Task do
  it { should belong_to :project }
  it { should belong_to :milestone }
  it { should belong_to :assigned_user }

  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :milestone_id }
  it { should allow_mass_assignment_of :state }
  it { should allow_mass_assignment_of :assigned_user_id }

  it "delegates assigned user name" do
    user = create(:user)
    task = create(:task, :assigned_user => user)
    task.assigned_user_name.should == user.name
  end
end
