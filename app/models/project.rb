# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class Project < ActiveRecord::Base
  # Access.
  USER  = 1
  ADMIN = 2
  
  # Associations.
  has_many :milestones
  
  # Validaton rules.
  validates_presence_of :name
end
