class AddUnpublishedAtToEcmNewsItems < ActiveRecord::Migration
  def change
    add_column :ecm_news_items, :unpublished_at, :timestamp
  end
end
