# frozen_string_literal: true

module Movies
  module Representers
    class OneMovie
      attr_reader :movie

      def initialize(movie)
        @movie = movie
      end

      def basic
        {
          id: movie.id,
          name: movie.name,
          genre: movie.genre
        }
      end
    end
  end
end
