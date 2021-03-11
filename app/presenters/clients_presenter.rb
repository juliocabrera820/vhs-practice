class ClientsPresenter
  def initialize(clients)
    @clients = clients
  end

  def as_json
    clients.map do |client|
      {
        id: client.id,
        name: client.name,
        home_address: client.home_address,
        rentals: client.rentals
      }
    end
  end

  private

  attr_reader :clients
end
