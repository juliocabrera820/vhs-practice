# frozen_string_literal: true

class RecordBase < ActiveRecord::Base
  self.abstract_class = true
end
