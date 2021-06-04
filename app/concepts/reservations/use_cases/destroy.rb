module Reservations
  module UseCases
    class Destroy
      attr_reader :repository

      def initialize(repository: Repository.new)
        @repository = repository
      end

      def call(id:)
        repository.delete(id)
      end
    end
  end
end

