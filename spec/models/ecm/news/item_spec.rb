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

      it "should only accept unique titles" do
        FactoryGirl.create(:ecm_news_item)
        Ecm::News::Item.new.should validate_uniqueness_of( :title )
      end

      it { should validate_presence_of(:body) } 
      it { should validate_presence_of(:markup_language) }  
      %w(markdown textile mediawiki rdoc).each do |value|
        it { should allow_value(value).for(:markup_language) }  
      end
      %w(some other values that are not allowed).each do |value|
        it { should_not allow_value(value).for(:markup_language) }  
      end    
      
    end
  end  
end  
