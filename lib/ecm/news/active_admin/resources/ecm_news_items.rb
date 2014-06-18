require 'ecm/news/active_admin/base'

include ActsAsPublished::ActiveAdminHelper

::ActiveAdmin.register Ecm::News::Item do
  Ecm::News::ActiveAdmin::Base.configure(self)
  
  # acts as published
  acts_as_published_actions

  # scopes
  scope :all
  scope :visible
  scope :invisible

  form do |f|
    f.inputs do
      f.input :title
      f.input :locale, :as => :select, :collection => I18n.available_locales.map(&:to_s)
      f.input :body
      f.input :published
      f.input :published_at
      f.input :unpublished_at      
    end

    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::News::Configuration.markup_languages.map(&:to_s)
    end

    f.actions
  end

  index do
    selectable_column
    column :title
    column :locale
    column :body do |item|
      truncate(item.body(:as => :html), :length => 250, :separator => ' ').html_safe
    end
    acts_as_published_columns
    column :created_at
    column :updated_at
    actions
  end

  show :title => :to_s do
    panel Ecm::News::Item.human_attribute_name(:body) do
      div do
        ecm_news_item.body(:as => :html).html_safe
      end
    end
  end # show
  
  sidebar Ecm::News::Item.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_news_item do
      row :title
      row :locale
      row :visible? do |item|
        I18n.t(item.visible?.to_s)
      end
      row :published do |item|
        I18n.t(item.published.to_s)
      end
      row :published_at
      row :unpublished_at
      row :link_to_more
      row :markup_language
      row :created_at
      row :updated_at
    end
  end
end if defined?(::ActiveAdmin)

