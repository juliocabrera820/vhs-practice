# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    it 'returns movies' do
      get '/api/v1/movies'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
  end
  describe 'GET /movies' do
    it 'returns all movies' do
      FactoryBot.create_list(:random_movie, 4)
      get '/api/v1/movies'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(4)
    end
  end
  describe 'POST /movies' do
    it 'returns a new movie' do
      post '/api/v1/movies',
           params: { title: 'cob', year: 2010, length: 110, director: 'alexi',
                     description: 'shadows' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'title' => 'cob',
          'year' => 2010,
          'length' => 110,
          'description' => 'shadows',
          'director' => 'alexi',
          'movie_genres' => [] }
      )
    end
  end
  describe 'POST /movies' do
    it 'returns an unprocessable entity status' do
      post '/api/v1/movies', params: { title: 'cob', year: 2010, length: 110, director: 'alexi', description: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /movies/6' do
    it 'returns a movie with id=6' do
      FactoryBot.create(:movie)
      get '/api/v1/movies/6'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 6,
          'title' => 'midsommar',
          'year' => 2019,
          'length' => 110,
          'description' => 'cultural',
          'director' => 'idk idk',
          'movie_genres' => [] }
      )
    end
  end
  describe 'DELETE /api/v1/movies' do
    let(:movie) { FactoryBot.create(:random_movie) }
    it 'returns no content status' do
      delete "/api/v1/movies/#{movie.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
