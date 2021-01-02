# frozen_string_literal: true

class Vhs < ApplicationRecord
  validates :serial_number, presence: true, numericality: { only_integer: true }
end
