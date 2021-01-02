# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieGenre, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:genre_id) }
  end
  describe 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:genre) }
  end
end
