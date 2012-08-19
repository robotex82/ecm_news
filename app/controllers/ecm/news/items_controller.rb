class Ecm::News::ItemsController < ApplicationController
  def index
    @items = Ecm::News::Item.all
  end

  def show
    @item = Ecm::News::Item.find(params[:id])
  end
end
