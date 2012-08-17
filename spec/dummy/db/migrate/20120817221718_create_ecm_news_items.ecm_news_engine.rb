# This migration comes from ecm_news_engine (originally 1)
class CreateEcmNewsItems < ActiveRecord::Migration
  def change
    create_table :ecm_news_items do |t|
      t.string :title
      t.text :body
      t.timestamp :published_at
      t.boolean :link_to_more
      t.string :slug

      t.timestamps
    end
  end
end
