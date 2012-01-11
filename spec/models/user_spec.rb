require 'spec_helper'

describe User do
  describe "is_admin?" do
    it "should respond with boolean" do
      user = build(:user)
      user.is_admin?.should === false
      
      user = build(:user, :admin => true)
      user.is_admin?.should === true
    end
  end
end
