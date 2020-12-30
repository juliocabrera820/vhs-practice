# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show update destroy]

      def index
        @clients = Client.all
        render json: @clients, status: :ok
      end

      def show
        render json: @client, status: :ok
      end

      def create
        @client = Client.new(client_params)
        if @client.save
          render json: @client, status: :created
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @client.destroy
        head :no_content
      end

      def update
        if @client.update(client_params)
          render json: @client, status: :ok
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      private

      def set_client
        @client = Client.find(params[:id])
      end

      def client_params
        params.permit(:name, :home_address)
      end
    end
  end
end