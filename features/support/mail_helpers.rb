#++
# Freedom - Mind-blowing issue tracker.
#
# http://github.com/vesln/freedom
# Veselin Todorov <hi@vesln.com>
# MIT License
#--

module MailHelpers
  def last_sent_email
    ActionMailer::Base.deliveries.last
  end
end

World(MailHelpers)
