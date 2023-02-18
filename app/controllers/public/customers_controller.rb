class Public::CustomersController < ApplicationController
  def show 
    @customer = current_user
  end
end
