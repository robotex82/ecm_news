require 'spec_helper'

describe "routing to news items" do
  it "routes /ecm_news_items to index" do
    expect(:get => "/ecm_news_items").to route_to(
      :controller => "ecm/news/items",
      :action => "index"
    )
  end # it

  it "routes /ecm_news_items/page/2 to index" do
    expect(:get => "/ecm_news_items/page/2").to route_to(
      :controller => "ecm/news/items",
      :action => "index",
      :page => "2"
    )
  end # it

  it "routes /ecm_news_items/example-item to show" do
    expect(:get => "/ecm_news_items/example-item").to route_to(
      :controller => "ecm/news/items",
      :action => "show",
      :id => "example-item"
    )
  end # it
end

