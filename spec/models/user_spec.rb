#--
# Freedom - Mind-blowing issue tracker.
#
# Copyright (c) 2012 Veselin Todorov <hi@vesln.com>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

require 'spec_helper'

describe User do
  
  describe "Associations" do
    it { should have_many(:users_projects) }
    it { should have_many(:projects) }
  end
  
  describe 'Scope' do
    it 'should have not_in_project scope' do
      expected = User.joins('LEFT JOIN `users_projects` ON `users_projects`.`user_id` = `users`.`id`').where("`users_projects`.`project_id` != ? OR `users_projects`.`project_id` IS NULL", 1).to_sql
      User.not_in_project(1).to_sql.should == expected
    end
  end
  
  describe "is_admin?" do
    it "should respond with boolean" do
      user = build(:user)
      user.is_admin?.should === false
      
      user = build(:user, :admin => true)
      user.is_admin?.should === true
    end
  end
  
  describe 'can_moderate?' do
    it 'shnould check if user is moderator for supplied project.' do
      user = create(:user, :admin => true)
      user.can_moderate?(1).should === true
      
      user = create(:user, :admin => false)
      users_project = create(:users_project, :project_id => 1, :user_id => user.id, access: Project::MODERATOR)
      user.can_moderate?(1).should === true
      
      user = create(:user, :admin => false)
      users_project = create(:users_project, :project_id => 1, :user_id => user.id, access: Project::USER)
      user.can_moderate?(1).should === false
      
      user = create(:user, :admin => false)
      user.can_moderate?(1).should === false
    end
  end
  
end
