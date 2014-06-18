$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_news"
  s.version     = Ecm::News::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_news"
  s.summary     = "News module for active admin."
  s.description = "News module for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  
  # Module dependencies  
  s.add_dependency 'activeadmin'
  # s.add_dependency 'acts_as_published', '~> 0.0.9.pre'
  s.add_dependency 'friendly_id'
  s.add_dependency 'kaminari'
  s.add_dependency 'bootstrap-kaminari-views'
  s.add_dependency 'RedCloth'
  if RUBY_VERSION < "1.9"
    s.add_dependency 'nokogiri', '~> 1.5.10'
  end

  if RUBY_PLATFORM =~ /java/
    s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  else
    s.add_development_dependency "sqlite3"
  end  


  # Development Server  
  s.add_development_dependency "puma" 
  s.add_development_dependency "quiet_assets"
#  if RUBY_PLATFORM =~ /java/
#    s.add_development_dependency "therubyrhino" 
#  else
#    s.add_development_dependency "therubyracer"
#  end
  
  # Documentation
  s.add_development_dependency "yard"
  
  # Active admin
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails' 
  s.add_development_dependency 'devise'
  s.add_development_dependency 'jquery-ui-rails'
  
#  # Tests
#  if RUBY_VERSION < "1.9.3"
#    s.add_development_dependency 'capybara', '< 2.0.0'    
#  else
#    s.add_development_dependency 'capybara'    
#  end
  s.add_development_dependency 'rspec-rails', '~> 2.12.0'  
#  if RUBY_VERSION < "1.9.2"
#    s.add_development_dependency 'shoulda-matchers', '< 2.0.0'    
#  else
#    s.add_development_dependency 'shoulda-matchers'    
#  end
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'
  
  # Test automation
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'  
  s.add_development_dependency 'rb-inotify', '~> 0.9'
  
#  # old ruby support
#  if RUBY_VERSION < "1.9.2"
#    s.add_dependency 'celluloid', '< 0.12.0'  
#    s.add_dependency 'rubyzip', '< 1.0.0'    
#  end
end
