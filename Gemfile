source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'pg'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'sprockets-rails'

gem 'importmap-rails'
gem 'puma', '~> 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'activerecord-postgres_pub_sub'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'rubocop'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
