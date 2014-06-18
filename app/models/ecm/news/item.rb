class Ecm::News::Item < ActiveRecord::Base
  # database settings
  self.table_name = 'ecm_news_items'

  # attributes
  attr_accessible :body,
                  :link_to_more,
                  :locale,
                  :markup_language,
                  :slug,
                  :title

  # callbacks
  after_initialize :set_defaults

  include ActsAsPublished::ActiveRecord
  acts_as_published

  # friendly id
  extend FriendlyId
  friendly_id :title, :use => :slugged

  # validations
  validates :title,  :presence => true, :uniqueness => true
  validates :locale, :presence  => true,
                     :inclusion => I18n.available_locales.map(&:to_s)
  validates :body,   :presence => true
  validates :markup_language, :presence  => true,
                              :inclusion => Ecm::News::Configuration.markup_languages.map(&:to_s)

  def body(options = {})
    options.reverse_merge!(:as => :plain)
    case options[:as]
    when :html
      markup(self[:body])
    else
      self[:body]
    end
  end

  def to_s
    title
  end

  private

  def markup(text)
    case markup_language.to_sym
    when :textile
      RedCloth.new(text).to_html
    else
      raise "Unsupported markup language #{markup_language}"
    end
  end

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::News::Configuration.default_markup_language
      self.published = false if published.nil?
    end
  end
end

