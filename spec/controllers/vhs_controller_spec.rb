# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::VhsController, type: :controller do
  describe 'POST /vhs' do
    it 'creates a new vhs' do
      params = { serial_number: 4_512_045 }
      should permit(:serial_number).for(:create, params: params)
    end
    it 'does not create a new vhs' do
      params = { serial_number: 4_512_045, color: 'black' }
      should_not permit(:color).for(:create, params: params)
    end
  end
  describe 'GET /vhs/:id' do
    it { should use_before_action(:set_vhs) }
  end
  describe 'DELETE /vhs/:id' do
    it { should use_before_action(:set_vhs) }
  end
  describe 'PUT /vhs/:id' do
    it { should use_before_action(:set_vhs) }
  end
end
