# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class Project < ActiveRecord::Base
  # Associations.
  has_many :milestones
  
  # Validaton rules.
  validates_presence_of :name
end
