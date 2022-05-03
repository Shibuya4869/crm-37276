class OrdersController < ApplicationController
  before_action :find_params, only: [:edit, :update]

  def index
    @orders = Order.all.order('created_at ASC')
  end
  
  def new
    @prospect = Prospect.find(params[:prospect_id])
    @orders = Order.new
  end

  def create
    @order = Order.new(order_params)
    # binding.pry
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

  private

  def order_params
    params.require(:order).permit(
      :prospect_id, :service_id, :client_id, :user_id, :order_date, :expiry, :license, :note
    ).merge(prospect_id: 1)#1固定にしているので要変更
  end

  def find_params
    @order = Order.find(params[:id])
  end

end
