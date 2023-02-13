class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private

  def item_params
    params.require(:book).permit(:title ,:body)
  end
end
