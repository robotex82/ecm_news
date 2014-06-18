class AddPublishedToEcmNewsItems < ActiveRecord::Migration
  def change
    add_column :ecm_news_items, :published, :boolean
  end
end
