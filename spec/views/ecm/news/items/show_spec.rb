require 'spec_helper'

describe "ecm/news/items/show" do
  it "renders _item partial" do
    @item = FactoryGirl.create(:ecm_news_item)
    assign(:item, @item)
    render
    view.should render_template(:partial => "_item", :count => 1)
  end 
  
  it "shows the item title in a heading" do
    item = FactoryGirl.create(:ecm_news_item)
    assign(:item, item)
    render
    rendered.should have_selector("h1", :text => item.title)
  end  
  
  it "shows a link to go back to the news index page" do
    item = FactoryGirl.create(:ecm_news_item)
    assign(:item, item)
    render
    rendered.should have_selector("a", :href => ecm_news_items_path)  
  end 
end
