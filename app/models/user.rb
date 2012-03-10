#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :password, :password_confirmation, :as => :registered
  acts_as_authentic
end
