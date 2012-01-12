# Freedom - Mind-blowing issue tracker.
# Veselin Todorov <hi@vesln.com>
# MIT License

require 'spec_helper'

describe Project do
  
  describe "Associations" do
    it { should have_many(:milestones) }
  end

  describe "Validation" do
    it { should validate_presence_of(:name) }
  end
  
  describe 'Access' do
    it 'should have user access' do 
      Project::USER.should eq (1)
    end
    
    it 'should have admin access' do 
      Project::ADMIN.should eq (2)
    end
  end
  
end
