#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  attr_accessible :name, :password, :password_confirmation, :as => :registered

  validates_presence_of :name

  acts_as_authentic
end
