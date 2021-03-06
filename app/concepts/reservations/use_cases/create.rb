# frozen_string_literal: true

module Reservations
  module UseCases
    class Create
      attr_reader :repository

      def initialize(repository: Repository.new)
        @repository = repository
      end

      def call(params:)
        repository.create(params)
      end
    end
  end
end
