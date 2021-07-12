source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'jbuilder', '~> 2.7'
gem 'carrierwave', '~> 2.2', '>= 2.2.1'
gem 'fog-aws', '~> 3.10'
gem 'mini_magick', '~> 4.11' # need sudo apt install imagemagick
gem 'file_validators', '~> 3.0'
gem 'devise', '~> 4.8'
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher
gem 'down', '~> 5.2', '>= 5.2.1'
gem 'pundit', '~> 2.1'
gem 'resque', '~> 2.0'
gem 'omniauth-facebook', '~> 8.0'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  gem 'pry-rails'
  gem 'letter_opener', '~> 1.7'
  gem 'capistrano', '~> 3.16'
  gem 'capistrano-rails', '~> 1.6', '>= 1.6.1'
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0', '>= 2.0.1'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'pundit-matchers', '~> 1.6'
  gem 'factory_bot_rails'
end
