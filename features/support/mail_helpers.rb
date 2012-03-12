module MailHelpers
  def last_sent_email
    ActionMailer::Base.deliveries.last
  end
end

World(MailHelpers)
