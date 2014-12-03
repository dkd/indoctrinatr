source 'https://rubygems.org'

ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.8'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Frontend stuff
gem 'foundation-rails', '~> 5.4.5'
gem 'simple_form', '~> 3.0.2'
gem 'nested_form', '~> 0.3.2'
gem 'foundation-icons-sass-rails', '~> 3.0.0'
gem 'kaminari', '~> 0.16.1'
gem 'jquery-ui-rails', '~> 5.0.0'
gem 'jquery-turbolinks', '~> 2.1.0'

# Testing tools
group :development, :test do
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec', '~> 3.1.0'
  gem 'guard-rspec', '~> 4.3.1', require: false
  gem 'growl', '~> 1.0.3' # OR use: gem 'terminal-notifier-guard'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'shoulda', '~> 3.5.0'
  gem 'listen', '~> 2.8.1'
end

# Development tools
group :development do
  gem 'rails_layout', '~> 1.0.22'
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'quiet_assets', '~> 1.0.3'
  gem 'sqlite3', '~> 1.3.9'
  gem 'rails-erd', '~> 1.1.0'
  gem 'annotate', '~> 2.6.5'
  gem 'rubocop', '~> 0.27.0'
end

gem 'rails-latex', github: 'ncreuschling/rails-latex'
gem 'erubis', '~> 2.7.0'
gem 'paperclip', '~> 4.2.0'
gem 'rubyzip', '~> 1.1.6'
gem 'to_latex', '~> 0.5.0'
gem 'RedCloth', '~> 4.2.9'

# Add group for mysql Support
group :mysql do
  gem 'mysql2', '~> 0.3.17'
end

# Use unicorn as the app server
group :unicorn do
  gem 'unicorn', '~> 4.8.3'
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# if none exists use this group
group :jsruntime do
  gem 'therubyracer', platforms: :ruby
end

