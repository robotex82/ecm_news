class Ecm::News::Item < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_news_items'
  
  # attributes
  attr_accessible :body, 
                  :link_to_more, 
                  :published_at, 
                  :slug, 
                  :title
                  
  # friendly id
  extend FriendlyId
  friendly_id :title, :use => :slugged
                  
  # validations
  validates :title, :presence => true
  validates :body, :presence => true
end
