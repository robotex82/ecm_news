require 'spec_helper'

describe "ecm/news/items/show" do
  before do
    @item = FactoryGirl.create(:ecm_news_item)
    assign(:item, @item)
    render
  end

  it "renders _item partial" do
    view.should render_template(:partial => "_item", :count => 1)
  end

  it "shows the item title in a heading" do
    rendered.should have_selector("h1", :text => @item.title)
  end

  it "shows a link to go back to the news index page" do
    rendered.should have_xpath("//a[@href='javascript:history.back()']")
  end
end

