#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

class UserObserver < ActiveRecord::Observer
  def after_create(user)
    SignupMailer.welcome(user).deliver
  end
end
