class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :password, :password_confirmation, :as => :registered
  acts_as_authentic
end
