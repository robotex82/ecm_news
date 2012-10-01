require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module News
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :render_news_default_count
      @@render_news_default_count = 2
    end
  end
end
