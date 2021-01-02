# frozen_string_literal: true

class VhsSerializer < ActiveModel::Serializer
  attributes :id, :serial_number
  has_many :rentals
end
