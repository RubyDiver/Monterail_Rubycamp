# frozen_string_literal: true

module Users
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Users::Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end
    end
  end
end
