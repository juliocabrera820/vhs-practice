# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ClientsController, type: :controller do
  describe 'POST /clients' do
    it 'creates a new client' do
      params = { name: 'horror', home_address: 'c 88 #454' }
      should permit(:name).for(:create, params: params)
    end
    it 'does not create a new client' do
      params = { name: 'horror', home_address: 'c 88 #454', zip_code: '854222' }
      should_not permit(:zip_code).for(:create, params: params)
    end
  end
  describe 'GET /clients/:id' do
    it { should use_before_action(:set_client) }
  end
  describe 'DELETE /clients/:id' do
    it { should use_before_action(:set_client) }
  end
  describe 'PUT /clients/:id' do
    it { should use_before_action(:set_client) }
  end
end
