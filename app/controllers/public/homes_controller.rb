class Public::HomesController < ApplicationController
  def top
    @item = Item.all
  end
end
