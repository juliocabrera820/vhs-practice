class ClientPresenter
  def initialize(client)
    @client = client
  end

  def as_json
    {
      id: client.id,
      name: client.name,
      home_address: client.home_address
    }
  end

  private

  attr_reader :client
end
