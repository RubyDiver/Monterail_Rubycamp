# frozen_string_literal: true

module Movies
  module UseCases
    class Show
      attr_reader :repository

      def initialize(repository: Movies::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.find(id)
      end
    end
  end
end
