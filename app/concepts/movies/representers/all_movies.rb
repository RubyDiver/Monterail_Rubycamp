# frozen_string_literal: true

module Movies
  module Representers
    class AllMovies
      attr_reader :movies

      def initialize(movies)
        @movies = movies
      end

      def basic
        movies.map do |movies|
          {
            id: movies.id,
            name: movies.name,
            genre: movies.genre
          }
        end
      end
    end
  end
end
