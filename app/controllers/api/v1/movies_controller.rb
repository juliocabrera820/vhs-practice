# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[show update destroy]

      def index
        @movies = Movie.all
        render json: @movies, status: :ok
      end

      def show
        render json: @movie, status: :ok
      end

      def create
        @movie = Movie.new(movie_params)
        if @movie.save!
          render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy!
        head :no_content
      end

      def update
        if @movie.update(movie_params)
          render json: @movie, status: :ok
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_params
        params.permit(:title, :year, :length, :description, :director)
      end
    end
  end
end
