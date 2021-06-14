module Seances
  module UseCases
    class RenderSeat
      attr_reader :seance

      def initialize(seance:)
        @seance = seance
      end

      def call
        {
          taken: taken_seats,
          available: available_seats
        }
      end

      private

      def available_seats
        Repository.new.available_seats(seance)
      end

      def taken_seats
        Repository.new.taken_seats(seance)
      end
    end
  end
end

