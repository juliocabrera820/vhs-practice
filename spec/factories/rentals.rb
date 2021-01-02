# frozen_string_literal: true

FactoryBot.define do
  factory :random_rental, class: Rental do
    client factory: :random_client
    vhs factory: :random_vhs
  end
  factory :rental, class: Rental do
    client factory: :client
    vhs factory: :vhs
  end
end
