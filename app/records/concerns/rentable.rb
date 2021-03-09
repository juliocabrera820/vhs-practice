# frozen_string_literal: true

module Rentable
  extend ActiveSupport::Concern
  included do
    has_many :rentals
  end
end
