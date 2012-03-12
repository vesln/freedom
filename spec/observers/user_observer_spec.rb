#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

require 'spec_helper'

describe UserObserver do
  describe 'after_create' do
    it "sends an welcome email to the user" do
      user = build(:user)
      mail = double("Signup mail")
      SignupMailer.should_receive(:welcome).with(user).and_return(mail)
      mail.should_receive(:deliver)
      user.save!
    end
  end
end
