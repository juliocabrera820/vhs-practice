# frozen_string_literal: true

class ClientRecord < BaseRecord
  self.table_name = 'clients'
  has_many :rentals, class_name: :RentalRecord, foreign_key: :client_id
end
