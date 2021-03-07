# frozen_string_literal: true

class ClientInput
  include ActiveModel::Model

  attr_accessor :name, :home_address

  validates :name, :home_address, presence: true
end
