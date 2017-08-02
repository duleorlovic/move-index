# so we do not need to prefix with FactoryGirl.create :user
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
