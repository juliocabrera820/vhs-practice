# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      def index
        @clients = ListClientsAction.new.perform.clients
        render json: ClientsPresenter.new(@clients).as_json, status: :ok
      end

      def show
        @client = ShowClientAction.new.perform(params[:id].to_i).client
        render json: ClientPresenter.new(@client).as_json, status: :ok
      end

      def create
        @client_input = ClientInput.new(client_params)
        CreateClientAction.new.perform(@client_input).and_then do |client:|
          render json: ClientPresenter.new(client).as_json, status: :created
        end
        .or_else do |errors|
          render json: errors, status: :unprocessable_entity
        end
      end

      def destroy
        DeleteClientAction.new.perform(params[:id])
        head :no_content
      end

      def update
        @client_input = ClientInput.new(client_params)
        UpdateClientAction.new.perform(params[:id], @client_input).and_then do |client:|
          render json: ClientPresenter.new(client).as_json, status: :ok
        end
        .or_else do |errors|
          render json: errors, status: :unprocessable_entity
        end
      end

      private

      def client_params
        params.permit(:name, :home_address)
      end
    end
  end
end
