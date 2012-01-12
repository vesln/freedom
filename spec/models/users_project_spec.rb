# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe UsersProject do
  
  describe "Associations" do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
  
end
