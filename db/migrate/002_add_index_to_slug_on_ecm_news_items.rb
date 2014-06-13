class AddIndexToSlugOnEcmNewsItems < ActiveRecord::Migration
  def change
    add_index :ecm_news_items, :slug, :unique => true
  end
end
