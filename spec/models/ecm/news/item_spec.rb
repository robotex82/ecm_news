require 'spec_helper'

module Ecm
  module News
    describe Item do
      subject { FactoryGirl.build(:ecm_news_item) }
      
      # friendly id
      it "should have a friendly id" do
        item = FactoryGirl.create(:ecm_news_item, :title => 'This is an item that should have a friendly id!')
        item.to_param.should == 'this-is-an-item-that-should-have-a-friendly-id'
      end 
        
      # validations
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:body) }      
      
    end
  end  
end  
