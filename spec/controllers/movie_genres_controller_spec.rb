# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MovieGenresController, type: :controller do
  describe 'POST /movie_genres' do
    it 'creates a new movie_genre' do
      params = { movie_id: 1, genre_id: 1 }
      should permit(:movie_id, :genre_id).for(:create, params: params)
    end
    it 'does not create a new movie_genre' do
      params = { movie_id: 'x', genre_id: 'x', code: 100 }
      should_not permit(:code).for(:create, params: params)
    end
  end
  describe 'GET /movie_genres/:id' do
    it { should use_before_action(:set_movie_genre) }
  end
  describe 'DELETE /movie_genres/:id' do
    it { should use_before_action(:set_movie_genre) }
  end
  describe 'PUT /movie_genres/:id' do
    it { should use_before_action(:set_movie_genre) }
  end
end
