module Ecm::NewsHelper
  def render_news(count = nil)
    count = count ||= Ecm::News::Configuration.render_news_default_count
    items = Ecm::News::Item.published.where(:locale => I18n.locale.to_s).limit(count)
    return I18n.t('ecm.news.item.messages.empty') if items.empty?
    output = ''
    output << render(:partial => 'ecm/news/items/item_preview', :collection => items, :as => :item)
    output << link_to(ecm_news_items_path, :class => 'btn list-link') do
      content_tag(:i, "", :class => 'icon-list') + " " +
      I18n.t('ecm.news.item.actions.all')
    end
    return output.html_safe
  end
end

