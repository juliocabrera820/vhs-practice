# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotUnique, with: :not_unique
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private

  def not_found
    render json: { message: 'record not found' }, status: :unprocessable_entity
  end

  def not_unique
    render json: { message: 'serial number must be unique' }, status: :unprocessable_entity
  end

  def invalid
    render json: { message: 'record not valid' }, status: :unprocessable_entity
  end

  def not_destroyed
    render json: { message: 'record not destroyed' }, status: :unprocessable_entity
  end
end
