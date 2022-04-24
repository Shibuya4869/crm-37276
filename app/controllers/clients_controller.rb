class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Prospect.new(client_params)
    if @client.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :name, :phone, :address
    )
  end
end
