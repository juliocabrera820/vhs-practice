# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Vhs', type: :request do
  describe 'GET /vhs' do
    it 'returns vhs' do
      get '/api/v1/vhs'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
    it 'returns all vhs' do
      FactoryBot.create_list(:random_vhs, 3)
      get '/api/v1/vhs'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe 'POST /vhs' do
    let(:movie) { FactoryBot.create(:movie) }
    it 'returns a new vhs' do
      post '/api/v1/vhs', params: { serial_number: 1_251_561, movie_id: movie.id }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 4,
          'serial_number' => 1_251_561,
          'rentals' => [] }
      )
    end
    it 'returns an unprocessable entity status due to serial number is a string' do
      post '/api/v1/vhs', params: { serial_number: 'w' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns a parameter missing exception' do
      post '/api/v1/vhs', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /vhs/5' do
    it 'returns a vhs with id=5' do
      FactoryBot.create(:vhs)
      get '/api/v1/vhs/5'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'serial_number' => 4_512_045,
          'rentals' => [] }
      )
    end
  end
  describe 'DELETE /api/v1/vhs' do
    let(:vhs) { FactoryBot.create(:random_vhs) }
    it 'returns no content status' do
      delete "/api/v1/vhs/#{vhs.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
