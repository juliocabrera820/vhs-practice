# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MovieGenres', type: :request do
  describe 'GET /movie_genres' do
    it 'returns movie_genres' do
      get '/api/v1/movie_genres'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(0)
    end
    it 'returns all movie_genres' do
      FactoryBot.create_list(:random_movie_genre, 3)
      get '/api/v1/movie_genres'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
  describe 'POST /movie_genres' do
    let(:movie) { FactoryBot.create(:movie) }
    let(:genre) { FactoryBot.create(:genre) }
    it 'returns a new movie_genre' do
      post '/api/v1/movie_genres', params: { movie_id: movie.id, genre_id: genre.id }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 4,
          'movie' => { 'description' => 'cultural', 'director' => 'idk idk', 'id' => 4, 'length' => 110,
                       'title' => 'midsommar', 'year' => 2019 },
          'genre' => { 'id' => 4, 'name' => 'horror' } }
      )
    end
    it 'returns an unprocessable entity status with not valid entities' do
      post '/api/v1/movie_genres', params: { movie_id: 10, genre_id: 10 }
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'returns a parameter missing exception' do
      post '/api/v1/movie_genres', params: {}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET /movie_genres/5' do
    it 'returns a movie_genre with id=5' do
      FactoryBot.create(:movie_genre)
      get '/api/v1/movie_genres/5'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        { 'id' => 5,
          'movie' => { 'description' => 'cultural', 'director' => 'idk idk', 'id' => 5, 'length' => 110,
                       'title' => 'midsommar', 'year' => 2019 },
          'genre' => { 'id' => 5, 'name' => 'horror' } }
      )
    end
  end
  describe 'DELETE /api/v1/movie_genres' do
    let(:movie_genre) { FactoryBot.create(:random_movie_genre) }
    it 'returns no content status' do
      delete "/api/v1/movie_genres/#{movie_genre.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
