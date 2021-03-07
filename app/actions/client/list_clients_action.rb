class ListClientsAction < Action
  result :clients

  def perform
    result.success(clients: ClientsRepository.new.all)
  end
end
