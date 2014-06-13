require 'acts_as_published'
require 'friendly_id'
require 'kaminari'
require 'bootstrap-kaminari-views'
require 'redcloth'

require 'ecm/news/exceptions'
require 'ecm/news/engine'
require 'ecm/news/configuration'
require 'ecm/news/routing'

module Ecm
  module News
    extend Configuration
  end
end
