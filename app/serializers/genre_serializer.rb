# frozen_string_literal: true

class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :movie_genres
end
