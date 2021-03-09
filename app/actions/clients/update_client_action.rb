# frozen_string_literal: true

class UpdateClientAction < BaseAction
  result :client

  def perform(id, input)
    if input.valid?
      client = ClientsRepository.new.update(id, input)
      result.success(client: client)
    else
      result.failure(input.errors)
    end
  end
end
