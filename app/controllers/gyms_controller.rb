class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

  # GET /gyms/:id
  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  # DELETE /gyms/:id
  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end

  private

  def error_not_found
    render json: { error: 'Gym not found' }, status: :not_found
  end
end
