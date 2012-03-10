class Milestone < ActiveRecord::Base
  attr_accessible :name
  belongs_to :project

  validates_presence_of :name
  validates_presence_of :project_id
end
