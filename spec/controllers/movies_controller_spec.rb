# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :controller do
  describe 'POST /movies' do
    it 'creates a new movie' do
      params = {  title: 'cob', year: 2010, length: 110, director: 'alexi',
                  description: 'shadows', zip_code: 52_010 }
      should permit(:title, :year, :length, :description, :director).for(:create, params: params)
    end
    it 'does not create a new movie' do
      params = { title: 'cob', year: 2010, length: 110, director: 'alexi',
                 description: 'shadows', zip_code: 52_010 }
      should_not permit(:zip_code).for(:create, params: params)
    end
  end
  describe 'GET /movies/:id' do
    it { should use_before_action(:set_movie) }
  end
  describe 'DELETE /movies/:id' do
    it { should use_before_action(:set_movie) }
  end
  describe 'PUT /movies/:id' do
    it { should use_before_action(:set_movie) }
  end
end
