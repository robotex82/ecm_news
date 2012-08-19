require 'ffaker'

# This will guess the User class
FactoryGirl.define do
  factory :ecm_news_item, :class => 'Ecm::News::Item' do
    sequence(:title) do |n| 
      "#{Faker::Lorem.paragraph(1)} #{n}" 
    end  
    body Faker::Lorem.paragraph(10)
    markup_language Ecm::News::Item::MARKUP_LANGAUGES.first
    published_at 5.minutes.ago
  end
end
