#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

module ProjectWorld
  attr_accessor :current_project

  def create_project(params = {})
    self.current_project = FactoryGirl.create(:project, params)
  end
end

World(ProjectWorld)
