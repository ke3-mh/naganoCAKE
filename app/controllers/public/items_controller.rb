class Public::ItemsController < ApplicationController
  def index
    @sum = Item.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
