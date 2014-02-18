source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby  # Ubuntu Development
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'
gem 'devise'
gem 'uuidtools'
gem 'font-awesome-sass'
gem 'friendly_id', '~> 5.0.0'

# my gems ###
gem 'thin'                                 # better webserver
gem 'quiet_assets', :group => :development # hide assets from development logs !!!!!!!
gem 'money-rails'                          # money conversions from integers
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
#############

# Authorization
gem 'cancan'
gem 'role_model'

# Image Handling
gem 'paperclip', '~> 3.0'
gem 'aws-sdk', '~> 1.20.0'

# Omniauth
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-github'

group :development, :test do
  gem 'sqlite3'
  gem 'letter_opener'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
