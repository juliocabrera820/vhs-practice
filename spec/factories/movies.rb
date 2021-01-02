# frozen_string_literal: true

FactoryBot.define do
  factory :random_movie, class: Movie do
    title { Faker::Movie.title }
    year { Faker::Vehicle.year }
    length { Faker::Vehicle.year }
    description { Faker::Lorem.characters(number: 25) }
    director { Faker::Name.name_with_middle }
  end
  factory :movie, class: Movie do
    title { 'midsommar' }
    year { 2019 }
    length { 110 }
    description { 'cultural' }
    director { 'idk idk' }
  end
end
