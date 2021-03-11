# frozen_string_literal: true

class RentalRecord < BaseRecord
  self.table_name = 'rentals'
  belongs_to :client, class_name: :ClientRecord
end
