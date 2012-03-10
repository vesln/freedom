require 'spec_helper'

describe Milestone do
  it { should belong_to(:project) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:project_id) }

  it { should allow_mass_assignment_of(:name) }
  it { should_not allow_mass_assignment_of(:project_id) }
end
