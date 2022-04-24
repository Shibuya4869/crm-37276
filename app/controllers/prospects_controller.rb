class ProspectsController < ApplicationController
  before_action :find_params, only: [:edit, :update]

  def index
    @prospects = Prospect.all.order('created_at ASC')
  end
  
  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new(prospect_params)
    if @prospect.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prospect.update(prospect_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def prospect_params
    params.require(:prospect).permit(
      :service_id, :client_id, :user_id, :scheduled_order_date, :license, :note
    )
  end

  def find_params
    @prospect = Prospect.find(params[:id])
  end

end
