# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

class UsersProject < ActiveRecord::Base
  
  # Associations.
  belongs_to :user
  belongs_to :project
  
end
