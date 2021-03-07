# frozen_string_literal: true

class ClientsRepository
  def all
    client_record.all.map { |client| to_model(client.attributes) }
  end

  def create(input)
    client = client_record.create(name: input.name, home_address: input.home_address)
    to_model(client.attributes)
  end

  def find(id)
    client = client_record.find(id)
    to_model(client.attributes)
  end

  def update(id, input)
    client = client_record.find(id)
    client.update(name: input.name, home_address: input.home_address)
    to_model(client.attributes)
  end

  def delete(id)
    client = client_record.find(id)
    client.destroy
  end

  private

  def client_record
    @client_record = ClientRecord
  end

  def to_model(attributes)
    Client.new(**attributes.symbolize_keys)
  end
end
