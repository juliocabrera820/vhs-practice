# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genres', type: :request do
  describe 'GET /genres' do
    it 'returns genres' do
      get '/api/v1/genres'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  describe 'GET /genres' do
    it 'returns all genres' do
      FactoryBot.create_list(:random_genre, 3)
      get '/api/v1/genres'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe 'POST /genres' do
    it 'returns a new genre' do
      post '/api/v1/genres', params: { name: 'laura' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 4,
          'name' => 'laura',
          'movie_genres' => [] }
      )
    end
  end
  describe 'POST /genres' do
    it 'returns an unprocessable entity status' do
      post '/api/v1/genres', params: { name: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /genres/5' do
    it 'returns a genre with id=5' do
      FactoryBot.create(:genre)
      get '/api/v1/genres/5'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'name' => 'horror',
          'movie_genres' => [] }
      )
    end
  end
  describe 'DELETE /api/v1/genres' do
    let(:genre) { FactoryBot.create(:random_genre) }
    it 'returns no content status' do
      delete "/api/v1/genres/#{genre.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
