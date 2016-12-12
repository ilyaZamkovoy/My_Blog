require 'simplecov'
require 'support/factory_girl'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'
  add_filter 'app/models'
  add_filter 'app/mailers'
  add_filter 'app/sanitizers'
  add_filter 'app/controllers/concerns'

  add_group "Controllers", "app/controllers"
  add_group "Api_Controllers", "app/controllers/api/v1"
end
RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /\.bundle/
  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
