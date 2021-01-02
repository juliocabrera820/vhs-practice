# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:home_address) }
  end
  describe 'associations' do
    it { should have_many(:rentals) }
  end
end
