FactoryGirl.define do
  factory :ecm_news_item, :class => 'Ecm::News::Item' do
    sequence(:title) { "News Item ##{i}" }
    locale 'en'
    body 'This is the news item body'
    markup_language Ecm::News::Item::MARKUP_LANGAUGES.first
    published_at 5.minutes.ago
  end
end
