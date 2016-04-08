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

module Sample
  class User
    attr_reader :email, :password, :full_name

    def initialize(hash)
      @email = hash[:email]
      @password = hash[:password] || 'password'
      @full_name = hash[:full_name]
    end
  end
end
