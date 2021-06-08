# frozen_string_literal: true

module Users
  module UseCases
    class Show
      attr_reader :repository

      def initialize(repository: Users::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.find(id)
      end
    end
  end
end
