module Ecm::NewsHelper
  def render_news(count = nil)
    count = count ||= Ecm::News::Configuration.render_news_default_count
    items = Ecm::News::Item.visible.where(:locale => I18n.locale.to_s).order("published_at DESC").limit(count)

    return render 'ecm/news/no_news' if items.empty?
    output = ''
    output << render(:partial => 'ecm/news/items/item_for_render_news', :collection => items, :as => :item)
    output << render(:partial => 'ecm/news/render_news_footer')
    return output.html_safe
  end
end

