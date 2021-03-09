# frozen_string_literal: true

class DeleteClientAction < BaseAction
  result :client

  def perform(id)
    ClientsRepository.new.delete(id)
    result.success
  end
end
