class OrdersController < ApplicationController
  def index
    @orders = Order.all.order('created_at ASC')
  end
  
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :service_id, :client_id, :user_id, :order_date, :expiry, :license, :note
    )
  end

end
