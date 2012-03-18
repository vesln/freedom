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
  it { should belong_to :user }

  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :milestone_id }
  it { should allow_mass_assignment_of :state }
  it { should allow_mass_assignment_of :assigned_user_id }
  it { should allow_mass_assignment_of :description }

  it { should validate_presence_of :title }
  it { should validate_presence_of :project_id }
  it { should allow_value('new').for(:state) }
  it { should allow_value('open').for(:state) }
  it { should allow_value('resolved').for(:state) }
  it { should allow_value('hold').for(:state) }
  it { should allow_value('invalid').for(:state) }
  it { should_not allow_value('hacked').for(:state) }

  it "delegates assigned user name" do
    user = create(:user)
    task = create(:task, :assigned_user => user)
    task.assigned_user_name.should == user.name
  end

  it "ensures that the supplied milestone is related to its project" do
    project = create(:project, :id => 1)
    milestone = create(:milestone, :project_id => 2)
    task = build(:task, :project => project, :milestone => milestone)
    task.save
    task.should have(1).error_on(:milestone)
  end

  describe 'milestone_name' do
    context 'with milestone' do
      it "returns the milestone name" do
        milestone = create(:milestone)
        task = create(:task, :milestone => milestone)
        task.milestone_name.should eq milestone.name
      end
    end

    context 'without milestone' do
      it "returns default name" do
        task = create(:task)
        task.milestone_name.should eq 'None'
      end
    end
  end
end
