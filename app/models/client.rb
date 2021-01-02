# frozen_string_literal: true

class Client < ApplicationRecord
  include Rentable
  validates :name, :home_address, presence: true
end
