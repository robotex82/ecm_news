require 'spec_helper'

describe "ecm/news/items/index" do
  before(:all) do
    I18n.locale = :en
  end
  
  before(:each) do
    @items = FactoryGirl.create_list(:ecm_news_item, 3)
    assign(:items, @items)
    @items.stub!(:current_page).and_return(1)
    @items.stub!(:num_pages).and_return(1)
    @items.stub!(:limit_value).and_return(1)
    
    render
  end
    
  it "renders _item_for_preview partial for each news item" do
    view.should render_template(:partial => "_item_for_preview", :count => 3)
  end
  
  it "shows headings for all items" do
    @items.each do |i|
      rendered.should have_selector("h2", :text => i.title)
    end
  end
  
  it "shows links to all items" do
    @items.each do |i|
      rendered.should have_link("continue reading", :href => "/ecm_news_items/#{i.to_param}")
    end
  end
end
