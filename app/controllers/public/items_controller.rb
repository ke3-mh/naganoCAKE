class Public::ItemsController < ApplicationController
  def index
    @sum = Item.all
    @items = Item.all.page(params[:page]).per(8)
  end

  def show

  end
end
