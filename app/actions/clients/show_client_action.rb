# frozen_string_literal: true

class ShowClientAction < BaseAction
  result :client

  def perform(id)
    result.success(client: ClientsRepository.new.find(id))
  end
end
