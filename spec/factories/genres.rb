# frozen_string_literal: true

FactoryBot.define do
  factory :random_genre, class: Genre do
    name { Faker::Book.genre }
  end
  factory :genre, class: Genre do
    name { 'horror' }
  end
end
