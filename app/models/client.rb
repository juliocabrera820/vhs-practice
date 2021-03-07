# frozen_string_literal: true

class Client
  attr_reader :id, :name, :home_address, :created_at, :updated_at

  def initialize(id:, name:, home_address:, created_at:, updated_at:)
    @id = id
    @name = name
    @home_address = home_address
    @created_at = created_at
    @updated_at = updated_at
  end
end
