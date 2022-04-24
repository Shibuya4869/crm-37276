class ClientsController < ApplicationController
  before_action :find_params, only: [:edit, :update]

  def index
    @clients = Client.all
  end
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(
      :name, :phone, :address
    )
  end
  
  def find_params
    @client = Client.find(params[:id])
  end

end
