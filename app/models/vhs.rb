# frozen_string_literal: true

class Vhs < ApplicationRecord
  include Rentable
  validates :serial_number, presence: true, numericality: { only_integer: true },
                            uniqueness: { message: 'serial number already exists' }
  validates :movie_id, presence: true
  belongs_to :movie
end
