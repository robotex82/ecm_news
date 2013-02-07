FactoryGirl.define do
  factory :ecm_news_item, :class => 'Ecm::News::Item' do
    sequence(:title) { |i| "News Item ##{i}" }
    locale 'en'
    body 'This is the news item body'
    markup_language 'textile'
    published_at 5.minutes.ago
  end
end

