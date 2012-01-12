# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class Milestone < ActiveRecord::Base
  belongs_to :project
end
