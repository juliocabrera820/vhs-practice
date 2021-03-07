class CreateClientAction < Action
  result :client

  def perform(input)
    if input.valid?
      client = ClientsRepository.new.create(input)
      result.success(client: client)
    else
      result.failure(input.errors)
    end
  end
end
