#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe Project do
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:description) }

  it { should have_many(:milestones) }
  it { should have_many(:tasks) }

  it { should validate_presence_of(:name) }
end
