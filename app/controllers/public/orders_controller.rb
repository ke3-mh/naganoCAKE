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
    order = Order.new(order_params)
    order.save

    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_items = OrderItems.new
      @order_items.order_id = order.id
      @order_items.item_id = cart_item.item.id
      @order_items.unit_price = cart_item.item.price_excluding_tax
      @order_items.quantity = cart_item.amount
      @order_items.status = 0
      @order_items.save
    end

    CartItem.destroy_all
    redirect_to orders_complete
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
