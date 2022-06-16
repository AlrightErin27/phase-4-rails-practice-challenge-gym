class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

  # GET /clients
  def index
    render json: Client.all, status: :ok
  end

  # GET /clients/:id
  def show
    cli = Client.find(params[:id])
    render json: cli, status: :ok
  end

  # PATCH /clients/:id
  def update
    cli = Client.find(params[:id])
    cli.update!(client_params)
    render json: cli, status: :accepted
  end

  private

  def error_not_found
    render json: { error: 'Client not found' }, status: :not_found
  end

  def client_params
    params.permit(:name, :age)
  end
end
