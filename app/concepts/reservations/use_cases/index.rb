# frozen_string_literal: true

module Reservations
  module UseCases
    class Index
      attr_reader :repository

      def initialize(repository: Repository.new)
        @repository = repository
      end

      def call
        repository.find_all
      end
    end
  end
end
