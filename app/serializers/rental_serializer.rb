# frozen_string_literal: true

class RentalSerializer < ActiveModel::Serializer
  attributes :id, :current
  belongs_to :client
  belongs_to :vhs
end
