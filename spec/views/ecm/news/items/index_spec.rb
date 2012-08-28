require 'spec_helper'

describe "ecm/news/items/index" do
  before(:all) do
    I18n.locale = :en
  end
    
  it "renders _item_preview partial for each news item" do
    items = FactoryGirl.create_list(:ecm_news_item, 3)
    assign(:items, items)
    render
    view.should render_template(:partial => "_item_preview", :count => 3)
  end
  
  it "shows headings for all items" do
    items = FactoryGirl.create_list(:ecm_news_item, 3)
    assign(:items, items)
    render
    items.each do |i|
      rendered.should have_selector("h2", :text => i.title)
    end
  end
  
  it "shows links to all items" do
    items = FactoryGirl.create_list(:ecm_news_item, 3)
    assign(:items, items)
    render
    items.each do |i|
      rendered.should have_link("continue reading", :href => "/ecm_news_items/#{i.to_param}")
    end
  end
end
