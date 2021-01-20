# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vhs, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:serial_number) }
    it { should validate_presence_of(:movie_id) }
  end
  describe 'associations' do
    it { should have_many(:rentals) }
    it { should belong_to(:movie) }
  end
end
