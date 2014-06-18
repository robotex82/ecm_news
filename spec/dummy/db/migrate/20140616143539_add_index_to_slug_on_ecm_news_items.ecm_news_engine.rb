# This migration comes from ecm_news_engine (originally 2)
class AddIndexToSlugOnEcmNewsItems < ActiveRecord::Migration
  def change
    add_index :ecm_news_items, :slug, :unique => true
  end
end
