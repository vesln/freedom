# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class Milestone < ActiveRecord::Base
  # Associations.
  belongs_to :project
  
  # Validaton rules.
  validates_presence_of :title
  validates_presence_of :project_id
end
