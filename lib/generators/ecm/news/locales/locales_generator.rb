module Ecm
  module News
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.news.en.yml", "config/locales/ecm.news.en.yml"
          copy_file "ecm.news.de.yml", "config/locales/ecm.news.de.yml"
          copy_file "ecm.news.item.en.yml", "config/locales/ecm.news.item.en.yml"
          copy_file "ecm.news.item.de.yml", "config/locales/ecm.news.item.de.yml"
        end   
      end
    end
  end
end        
