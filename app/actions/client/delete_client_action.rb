class DeleteClientAction < Action
  result :client

  def perform(id)
    ClientsRepository.new.delete(id)
    result.success
  end
end
