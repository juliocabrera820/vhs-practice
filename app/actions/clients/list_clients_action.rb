# frozen_string_literal: true

class ListClientsAction < BaseAction
  result :clients

  def perform
    result.success(clients: ClientsRepository.new.all)
  end
end
