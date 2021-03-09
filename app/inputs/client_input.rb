# frozen_string_literal: true

class ClientInput < BaseInput
  attribute :name
  attribute :home_address

  validates :name, :home_address, presence: true
end
