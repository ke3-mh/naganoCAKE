class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    ## 登録済住所実装したときは以下に変更する
    # elsif [:order][:select_address] == "2"
    #   @order = Order.new(order_params)
    #   @address = Address.find(params[:order][:address_id])
    #   @order.postal_code = @address.postal_code
    #   @order.address = @address.address
    #   @order.name = @address.name

    elsif params[:order][:select_address] == "3"
      @order.customer_id = current_customer.id
    end
    
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def complete
  end

  def create

  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
