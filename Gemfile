source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :production do
  gem 'pg'
  gem 'fog'
end

group :development, :test do
  gem 'sqlite3'
#  gem 'ruby-debug-base19'
#  gem 'ruby-debug19', :require => false
#  gem 'ruby-debug-base19', :git => 'https://github.com/tribune/ruby-debug-base19.git', :require => false
#  gem 'linecache19' , :git => 'https://github.com/chuckg/linecache19.git', :branch => "0_5_13/dependencies", :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'therubyracer'
gem 'will_paginate', '~> 3.0'
gem 'haml'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.12'
#gem "devise-async"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Refinery CMS
gem 'refinerycms', '~> 2.0.0'
# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
#  gem 'refinerycms-blog', '~> 2.0.0'
#  gem 'refinerycms-inquiries', '~> 2.0.0'
#  gem 'refinerycms-search', '~> 2.0.0'
#  gem 'refinerycms-page-images', '~> 2.0.0'

gem 'refinerycms-categories', :path => 'vendor/extensions'
gem 'refinerycms-subcategories', :path => 'vendor/extensions'
gem 'refinerycms-shops', :path => 'vendor/extensions'
gem 'refinerycms-services', :path => 'vendor/extensions'
gem 'refinerycms-companies', :path => 'vendor/extensions'
gem 'refinerycms-banners', :path => 'vendor/extensions'
gem 'refinerycms-menus', :path => 'vendor/extensions'
gem 'refinerycms-topics', :path => 'vendor/extensions'
gem 'refinerycms-posts', :path => 'vendor/extensions'