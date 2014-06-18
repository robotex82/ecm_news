source "http://rubygems.org"

# Declare your gem's dependencies in ecm_news.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug'

# Patched acts_as_markup for jruby compatibility
# gem 'acts_as_markup', :path => '~/rails/forks/acts_as_markup-master'

# Edge active admin
# gem 'activeadmin', :git => 'https://github.com/gregbell/active_admin.git'

gem 'acts_as_published', :path => '~/rails/forks/acts_as_published-master'

unless ENV['TRAVIS_RUBY_VERSION'].nil?
  gem 'pg'
  gem 'mysql2'
end

group :development, :test do
  platforms :ruby do
    gem "therubyracer" 
  end
  
  platforms :jruby do
    gem "therubyrhino" 
  end
end

group :test do
  case
  when RUBY_VERSION < "1.9.3"
    gem 'capybara', '< 2.0.0'
  when RUBY_VERSION < "1.9.2"
    gem 'shoulda-matchers', '< 2.0.0'   
  else
    gem 'capybara'
    gem 'shoulda-matchers'    
  end
end

case
when RUBY_VERSION < "1.9.2"
  gem 'celluloid', '< 0.12.0'  
  gem 'rubyzip', '< 1.0.0' 
else   
end
