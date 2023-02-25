class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
  end
  
  def about
    
  end
end
