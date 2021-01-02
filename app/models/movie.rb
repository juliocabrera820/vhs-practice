# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, :year, :length, :description, :director, presence: true
  validates :length, numericality: { only_integer: true }
  validates :year, numericality: { only_integer: true }
end