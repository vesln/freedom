# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe Milestone do
  
  describe "Associations" do
    it { should belong_to(:project) }
  end

  describe "Validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:project_id) }
  end
end
