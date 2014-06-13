require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module News
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :base_controller
      @@base_controller = 'ApplicationController'

      mattr_accessor :default_markup_language
      @@default_markup_language = nil

      mattr_accessor :markup_languages
      @@markup_languages = []

      mattr_accessor :news_item_preview_length
      @@news_item_preview_length = nil

      mattr_accessor :render_news_default_count
      @@render_news_default_count = 2

      def self.base_controller=(class_name)
        raise BaseControllerNotDefinedError unless Object.const_defined?(class_name)
        @@base_controller = class_name.constantize
      end
    end
  end
end
