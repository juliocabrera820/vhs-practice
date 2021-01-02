# frozen_string_literal: true

class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :home_address
  has_many :rentals
end
