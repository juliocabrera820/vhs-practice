# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::GenresController, type: :controller do
  describe 'POST /genres' do
    it 'creates a new genre' do
      params = { name: 'horror' }
      should permit(:name).for(:create, params: params)
    end
  end
  describe 'POST /genres' do
    it 'does not create a new genre' do
      params = { name: 'horror', country: 'norway' }
      should_not permit(:country).for(:create, params: params)
    end
  end
  describe 'GET /genres/:id' do
    it { should use_before_action(:set_genre) }
  end
  describe 'DELETE /genres/:id' do
    it { should use_before_action(:set_genre) }
  end
  describe 'PUT /genres/:id' do
    it { should use_before_action(:set_genre) }
  end
end
