# frozen_string_literal: true

FactoryBot.define do
  factory :random_movie_genre, class: MovieGenre do
    movie factory: :random_movie
    genre factory: :random_genre
  end
  factory :movie_genre, class: MovieGenre do
    movie factory: :movie
    genre factory: :genre
  end
end
