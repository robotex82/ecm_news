include ActsAsPublished::ActiveAdminHelper

::ActiveAdmin.register Ecm::News::Item do
  # acts as published
  acts_as_published_actions

  # menu entry settings
  menu :parent => Proc.new { I18n.t('ecm.news.active_admin.menu') }.call
  
  # scopes
  scope :all
  scope :published
  scope :unpublished
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :published, :as => :boolean
    end
    
    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::News::Item::MARKUP_LANGAUGES    
    end
    
    f.actions
  end
  
  index do
    selectable_column
    column :title
    column :body
    acts_as_published_columns
    column :created_at
    column :updated_at
    default_actions
  end
  
  show do
    attributes_table do
      row :title
      row :published_at
      row :link_to_more
      row :markup_language
      row :created_at
      row :updated_at
    end
    
    panel Ecm::News::Item.human_attribute_name(:body) do
      div { ecm_news_item.body.to_html.html_safe }
    end
  end
end if defined?(::ActiveAdmin)
