# frozen_string_literal: true

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :length, :director, :description
  has_many :movie_genres
end
