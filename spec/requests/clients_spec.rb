# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  describe 'GET /clients' do
    it 'returns zero clients' do
      get '/api/v1/clients'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
    it 'returns all clients' do
      FactoryBot.create_list(:random_client, 3)
      get '/api/v1/clients'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe 'POST /clients' do
    it 'returns a new client' do
      post '/api/v1/clients', params: { name: 'laura', home_address: 'c 55' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 4,
          'name' => 'laura',
          'home_address' => 'c 55',
          'rentals' => [] }
      )
    end
    it 'returns an unprocessable entity status due to empty home address' do
      post '/api/v1/clients', params: { name: 'john', home_address: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns a parameter missing exception' do
      post '/api/v1/clients', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /clients/5' do
    it 'returns a client with id=5' do
      FactoryBot.create(:client)
      get '/api/v1/clients/5'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'name' => 'john',
          'home_address' => 'c 21 #44',
          'rentals' => [] }
      )
    end
  end
  describe 'DELETE /api/v1/clients' do
    let(:client) { FactoryBot.create(:random_client) }
    it 'returns no content status' do
      delete "/api/v1/clients/#{client.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
