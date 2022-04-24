class ProspectsController < ApplicationController
  def index
    @prospects = Prospect.all.order('created_at ASC')
    # binding.pry
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

  private

  def prospect_params
    params.require(:prospect).permit(
      :service_id, :client_id, :user_id, :scheduled_order_date, :license, :note
    )
  end

end
