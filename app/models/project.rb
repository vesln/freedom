#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Project < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :milestones
  has_many :tasks

  validates_presence_of :name
end
