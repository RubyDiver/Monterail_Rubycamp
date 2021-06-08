# frozen_string_literal: true

module Users
  module UseCases
    class Destroy
      attr_reader :repository

      def initialize(repository: Users::Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.delete(id)
      end
    end
  end
end
