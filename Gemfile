source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'carrierwave'
gem 'devise'
gem 'down'
gem 'file_validators'
gem 'fog-aws'
gem 'jbuilder'
gem 'mini_magick', '~> 4.11' # need sudo apt install imagemagick
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'pg'
gem 'psych', '< 4'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 6.1.3'
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher
gem 'resque', '~> 2.0'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'capistrano', '~> 3.16'
  gem 'capistrano-bundler', '~> 2.0', '>= 2.0.1'
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano-rails', '~> 1.6', '>= 1.6.1'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'factory_bot_rails'
  gem 'letter_opener', '~> 1.7'
  gem 'pry-rails'
  gem 'pundit-matchers', '~> 1.6'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end
