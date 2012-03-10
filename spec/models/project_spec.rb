require 'spec_helper'

describe Project do
  it { should have_many(:milestones) }
  it { should validate_presence_of(:name) }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:description) }
end
