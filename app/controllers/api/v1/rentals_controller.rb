# frozen_string_literal: true

module Api
  module V1
    class RentalsController < ApplicationController
      before_action :set_rental, only: %i[show update destroy]

      def index
        @clients = Rental.all
        render json: @clients, status: :ok
      end

      def show
        render json: @rental, status: :ok
      end

      def create
        @rental = Rental.new(rental_params)
        if @rental.save!
          render json: @rental, status: :created
        else
          render json: @rental.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @rental.destroy!
        head :no_content
      end

      def update
        if @rental.update(rental_params)
          render json: @rental, status: :ok
        else
          render json: @rental.errors, status: :unprocessable_entity
        end
      end

      private

      def set_rental
        @rental = Rental.find(params[:id])
      end

      def rental_params
        params.permit(:client_id, :vhs_id)
      end
    end
  end
end
