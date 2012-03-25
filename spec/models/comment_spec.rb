#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe Comment do
  it { should allow_mass_assignment_of :body }
  it { should belong_to :task }
  it { should validate_presence_of :task_id }
end
