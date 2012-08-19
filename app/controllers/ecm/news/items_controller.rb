class Ecm::News::ItemsController < ApplicationController
  def index
    @items = Ecm::News::Item.published.order("published_at DESC").all
  end

  def show
    @item = Ecm::News::Item.published.find(params[:id])
  end
end
