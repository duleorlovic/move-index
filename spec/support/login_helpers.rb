module MyLoginHelpers
  def create_logged_in_user
    user = FactoryGirl.create(:user)
    # login_as is warden method
    login_as user
    user
  end
end
RSpec.configure do |config|
  config.include Warden::Test::Helpers # this provides `login_as user`
  config.include MyLoginHelpers, type: :feature
end
