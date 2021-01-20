# frozen_string_literal: true

FactoryBot.define do
  factory :random_vhs, class: Vhs do
    serial_number { Faker::Number.number(digits: 8) }
    movie factory: :random_movie
  end
  factory :vhs, class: Vhs do
    serial_number { 4_512_045 }
    movie factory: :movie
  end
end
