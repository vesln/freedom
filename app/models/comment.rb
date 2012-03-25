#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :task
  validates_presence_of :task_id
end
