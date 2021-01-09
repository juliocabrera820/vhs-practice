# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RentalsController, type: :controller do
  describe 'POST /rentals' do
    it 'creates a new rental' do
      params = { client_id: 1, vhs_id: 1 }
      should permit(:client_id, :vhs_id).for(:create, params: params)
    end
    it 'does not create a new rental' do
      params = { client_id: 'x', vhs_id: 'x', code: 100 }
      should_not permit(:code).for(:create, params: params)
    end
  end
  describe 'GET /rentals/:id' do
    it { should use_before_action(:set_rental) }
  end
  describe 'DELETE /rentals/:id' do
    it { should use_before_action(:set_rental) }
  end
  describe 'PUT /rentals/:id' do
    it { should use_before_action(:set_rental) }
  end
end
