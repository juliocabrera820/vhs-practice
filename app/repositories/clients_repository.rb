# frozen_string_literal: true

class ClientsRepository < BaseRepository
  def all
    record_class.includes(:rentals).all { |record| to_model(record.attributes) }
  end

  # TODO: implement find method
  # TODO: implement create method
  # TODO: implement delete method
  # TODO: implement update method
end
