# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:director) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:year) }
    it { should validate_numericality_of(:length) }
  end
  describe 'associations' do
    it { should have_many(:movie_genres) }
  end
end
