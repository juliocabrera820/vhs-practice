class ShowClientAction < Action
  result :client

  def perform(id)
    result.success(client: ClientsRepository.new.find(id))
  end
end
