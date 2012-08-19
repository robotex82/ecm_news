require 'spec_helper'

describe "ecm/news/items/index" do
  it "renders _item_preview partial for each news item" do
    assign(:items, [stub_model(Ecm::News::Item), stub_model(Ecm::News::Item)])
    render
    view.should render_template(:partial => "_item_preview", :count => 2)
  end
  
  it "shows headings for all items" do
    items = FactoryGirl.create_list(:ecm_news_item, 5)
    assign(:items, items)
    render
    items.each do |i|
      rendered.should have_selector("h2", :text => i.title)
    end
  end
  
  it "shows links to all items" do
    items = FactoryGirl.create_list(:ecm_news_item, 5)
    assign(:items, items)
    render
    items.each do |i|
      rendered.should have_link("more", :href => "/ecm_news_items/#{i.to_param}")
    end
  end
end
