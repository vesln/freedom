# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class Project < ActiveRecord::Base
  has_many :milestones
end
