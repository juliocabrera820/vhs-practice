# frozen_string_literal: true

class RentalInput < BaseInput
  attribute :client_id
  attribute :vhs_id

  validates :client_id, :vhs_id, presence: true
end
