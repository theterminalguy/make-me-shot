source 'https://rubygems.org'
ruby "2.2.3"

gem 'rails', '4.2.4'
gem 'sqlite3', group:[:development, :test]
gem 'pg', group: :production
gem 'rails_12factor', group: :production
gem "puma", "2.11.1", group: :production 
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'pry'
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'
gem 'devise'
gem 'omniauth'
gem 'useragent'
gem "materialize-sass"
gem "font-awesome-sass"
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'simple_token_authentication', '~> 1.0'
gem 'active_model_serializers'  
 
gem 'coveralls', require: false
gem "codeclimate-test-reporter", group: :test, require: nil

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'minitest-rails', git:'https://github.com/blowmage/minitest-rails.git'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

