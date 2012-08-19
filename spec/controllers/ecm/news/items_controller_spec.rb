require 'spec_helper'

module Ecm
  module News
    describe ItemsController do
      describe "GET index" do
        it "assigns all ecm_news_items to @items" do
          item = FactoryGirl.create(:ecm_news_item)
          get :index
          assigns(:items).should eq([item])
        end
      end

      describe "GET show" do
        it "assigns a ecm_news_item to @item" do
          item = FactoryGirl.create(:ecm_news_item)
          get :show, :id => item
          assigns(:item).should eq(item)
        end
      end
    end
  end
end
