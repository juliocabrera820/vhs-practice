# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rentals', type: :request do
  describe 'GET /rentals' do
    it 'returns rentals' do
      get '/api/v1/rentals'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
    it 'returns all rentals' do
      FactoryBot.create_list(:random_rental, 3)
      get '/api/v1/rentals'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe 'POST /rentals' do
    let(:client) { FactoryBot.create(:client) }
    let(:vhs) { FactoryBot.create(:vhs) }
    it 'returns a new rental' do
      post '/api/v1/rentals', params: { client_id: client.id, vhs_id: vhs.id }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 4,
          'current' => true,
          'client' => { 'home_address' => 'c 21 #44', 'id' => 4, 'name' => 'john' },
          'vhs' => { 'id' => 4, 'serial_number' => 4_512_045 } }
      )
    end
    it 'returns an unprocessable entity status with not valid entities' do
      post '/api/v1/rentals', params: { client_id: 10, vhs_id: 10 }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns a parameter missing exception' do
      post '/api/v1/rentals', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /rentals/5' do
    it 'returns a rental with id=5' do
      FactoryBot.create(:rental)
      get '/api/v1/rentals/5'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'current' => true,
          'client' => { 'home_address' => 'c 21 #44', 'id' => 5, 'name' => 'john' },
          'vhs' => { 'id' => 5, 'serial_number' => 4_512_045 } }
      )
    end
  end
  describe 'DELETE /api/v1/rentals' do
    let(:rental) { FactoryBot.create(:random_rental) }
    it 'returns no content status' do
      delete "/api/v1/rentals/#{rental.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
