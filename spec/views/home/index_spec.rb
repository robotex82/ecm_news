require 'spec_helper'

describe "home/index" do
  before(:all) do
    I18n.locale = :en
  end
    
  it "renders _item_for_render_news partial for the correct news item count" do
    FactoryGirl.create_list(:ecm_news_item, 5)
    render
    view.should render_template(:partial => "_item_for_render_news", :count => 2)
  end

end
