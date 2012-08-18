class Ecm::News::Item < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_news_items'
  
  # acts as markup
  # acts_as_textile :body
  acts_as_markup :language => :variable, :columns => [ :body ]
  
  # attributes
  attr_accessible :body, 
                  :link_to_more, 
                  :published_at, 
                  :slug, 
                  :title
                  
  # callbacks
  after_initialize :set_defaults   
  
  # constants
  MARKUP_LANGAUGES = %w(markdown textile mediawiki rdoc)             
                  
  # friendly id
  extend FriendlyId
  friendly_id :title, :use => :slugged
                  
  # validations
  validates :title, :presence => true
  validates :body,  :presence => true
  validates :markup_language, :presence  => true, 
                              :inclusion => MARKUP_LANGAUGES
  
  private
  
  def set_defaults
    if self.new_record?
      self.markup_language ||= 'textile'
    end  
  end
end
