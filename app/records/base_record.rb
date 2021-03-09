# frozen_string_literal: true

class BaseRecord < ActiveRecord::Base
  self.abstract_class = true
end
