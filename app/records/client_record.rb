# frozen_string_literal: true

class ClientRecord < RecordBase
  include Rentable
  self.table_name = 'clients'
end
