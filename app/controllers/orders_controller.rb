class OrdersController < ApplicationController
  before_action :find_params, only: [:edit, :update, :destroy]

  def index
    @orders = Order.all.order('order_date ASC')
  end
  
  def new
    @prospect = Prospect.find(params[:prospect_id])
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

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to action: :index
  end

  private

  def order_params
    # binding.pry
    params.require(:order).permit(
      :prospect_id, :user_id, :service_id, :client_id, :order_date, :expiry, :license, :note
    )
  end

  def find_params
    @order = Order.find(params[:id])
  end

end
