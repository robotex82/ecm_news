module Ecm
  module News
    class Routing
      # Creates the routes for news items. You can pass options to
      # specify the actions for news items.
      #
      #   Ecm::News::Routing.routes(self, { :item_actions => [ :show ]})
      #
      # This will only create the show action for items, but omit the index
      # action.
      def self.routes(router, options = {})
        options.reverse_merge!(
          { :item_actions => [:index, :show]
          }
        )

        router.resources :ecm_news_items, :only => options[:item_actions],
                                          :controller => 'ecm/news/items' do
          router.get 'page/:page', :action => :index, :on => :collection
        end
      end
    end
  end
end
