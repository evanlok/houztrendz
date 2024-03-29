source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise'
gem 'omniauth-onvedeo'
gem 'kaminari'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'figaro'
gem 'autoprefixer-rails'
gem 'simple_form'
gem 'paloma'
gem 'faraday'
gem 'faraday_middleware'
gem 'typhoeus'
gem 'honeybadger', '~> 2.0'
gem 'asset_sync'
gem 'non-stupid-digest-assets'
gem 'fog', require: 'fog/aws/storage'
gem 'newrelic_rpm'
gem 'lograge'
gem 'oj'
gem 'oj_mimic_json'
gem 'phony_rails'
gem 'carrierwave'
gem 'mini_magick'
gem 'pundit'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-ujs'
  gem 'rails-assets-bootstrap-sass-official'
  gem 'rails-assets-fontawesome'
  gem 'rails-assets-normalize-scss'
  gem 'rails-assets-jquery-minicolors'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'awesome_print'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'quiet_assets'
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'webmock'
  gem 'climate_control'
end

group :production do
  gem 'rails_12factor'
end
