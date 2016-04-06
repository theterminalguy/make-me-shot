require 'test_helper'
require 'capybara/rails'

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL

    def setup
      Capybara.javascript_driver = :webkit
    end

    def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
  end
end
