#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  context 'as registered' do
    it { should_not allow_mass_assignment_of(:email).as(:registered) }
    it { should allow_mass_assignment_of(:name).as(:registered) }
    it { should allow_mass_assignment_of(:password).as(:registered) }
    it { should allow_mass_assignment_of(:password_confirmation).as(:registered) }
  end

  it { should validate_presence_of :name }
end
