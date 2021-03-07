# frozen_string_literal: true

class ClientRecord < ApplicationRecord
  include Rentable
  self.table_name = 'clients'
end