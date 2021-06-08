# frozen_string_literal: true

module Users
  module UseCases
    class Update
      attr_reader :repository

      def initialize(repository: Users::Repository.new)
        @repository = repository
      end

      def call(id:, params:)
        repository.update(id, params)
      end
    end
  end
end
