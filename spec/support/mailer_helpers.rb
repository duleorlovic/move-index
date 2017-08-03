module MailerHelpers
  # capybara-email is also used so you can call:
  # open_email 'my@email.com' # to set current_email
  # current_email.click_link 'Link Text'

  def last_email
    # ActionMailer::Base.deliveries.last
    Devise.mailer.deliveries.last
  end

  # you can call this manually for specific test or for all
  # config.before(:each) { reset_email }
  def reset_email
    ActionMailer::Base.deliveries = []
  end
end
RSpec.configure do |config|
  config.include MailerHelpers
end
