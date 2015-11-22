class ClientsController < ApplicationController
  respond_to :html, :js

  before_action :authenticate_user!
  before_action :load_client, only: [:edit, :update, :show, :destroy]
  
  def index
    @clients = current_user.clients.order("created_at DESC")
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(permitted_params)
    @client.user_id = current_user.id
    flash[:notice] = 'Client was succesfully created' if @client.save
    respond_with @client, location: clients_path
  end

  def show
  end

  def edit
  end

  def update
    flash[:notice] = 'Client was updated ' if @client.update(permitted_params)
    respond_with @client,location: clients_path
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: "Deleted client: #{@client.email}"
  end

  def events
  end

  private

  def load_client
    @client = Client.find(params[:id])
  end

  def permitted_params
    params.require(:client).permit(:first_name,:last_name, :email, :zip_code)
  end
end
