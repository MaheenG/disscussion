source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'pg', '~> 1.1'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bulma-rails', '~> 0.6.2'
gem 'simple_form', '~> 3.5'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'gravatar_image_tag', '~> 1.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'rolify', '~> 5.2'
gem 'cancancan', '~> 2.1', '>= 2.1.3'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'kramdown', '~> 2.3'
gem 'kramdown-parser-gfm', '~> 1.1'
gem 'rouge', '~> 3.26'
gem 'coderay', '~> 1.1', '>= 1.1.2'

# Search functionality
gem 'pg_search', '~> 2.3'

# Windows-specific gem
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  # Testing gems
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  
  # System testing
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'guard', '~> 2.14', '>= 2.14.2'
  gem 'guard-livereload', '~> 2.5', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
