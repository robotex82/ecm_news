require 'spec_helper'

module Ecm::News
  describe Item do
    subject { FactoryGirl.build(:ecm_news_item) }

    describe 'associations' do
      it { should have_many :attached_pictures }
      it { should have_many :pictures }
    end # describe 'associations'

    # callbacks
    context 'sets default handler' do
      subject { Ecm::News::Item.new }
      its(:markup_language) { should eq(Ecm::News::Configuration.default_markup_language.to_s) }
    end

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
    it { should validate_presence_of(:locale) }
    it { should ensure_inclusion_of(:locale).in_array(I18n.available_locales.map(&:to_s)) }
    it { should validate_presence_of(:markup_language) }
    it { should ensure_inclusion_of(:markup_language).in_array(Ecm::News::Configuration.markup_languages.map(&:to_s)) }

  end
end

