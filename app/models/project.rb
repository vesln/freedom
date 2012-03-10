class Project < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :milestones
  validates_presence_of :name
end
