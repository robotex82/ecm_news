module Ecm::News::ActiveAdmin
  class Base
    def self.configure(definition)
      definition.menu :parent => Proc.new { I18n.t('ecm.news.active_admin.menu') }.call,
                      :url    => Proc.new { send("#{active_admin_config.namespace.name}#{definition.config.resource_class_name.underscore.pluralize.gsub('/', '_')}_path") }
    end
  end
end
