module Ecm
  module News
    class Engine < ::Rails::Engine
      # active admin
      initializer :ecm_news_engine do
        ::ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'lib/ecm/news/active_admin/resources')
        end
      end
    end
  end
end    
