require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'coveralls'
require 'simplecov'
Coveralls.wear!
SimpleCov.start

module ActiveSupport
  class TestCase
    fixtures :all
    self.use_transactional_fixtures = true
  end
end

module ActionController
  class TestCase
    include Devise::TestHelpers
  end
end

module FixtureFileHelpers
  def encrypted_password(password = 'password')
    User.new.send(:password_digest, password)
  end
end

ActiveRecord::FixtureSet.context_class.send :include, FixtureFileHelpers
