class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :error_unproc_entity

  # POST /memberships
  def create
    mem = Membership.create!(gym_params)
    render json: mem, status: :created
  end

  private

  def gym_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def error_unproc_entity(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
