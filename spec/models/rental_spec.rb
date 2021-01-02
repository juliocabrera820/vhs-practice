# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:client_id) }
    it { should validate_presence_of(:vhs_id) }
  end
  describe 'associations' do
    it { should belong_to(:client) }
    it { should belong_to(:vhs) }
  end
end
