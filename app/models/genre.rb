# frozen_string_literal: true

class Genre < ApplicationRecord
  include Generable
  validates :name, presence: true
end
