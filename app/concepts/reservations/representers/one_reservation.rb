# frozen_string_literal: true

module Reservations
  module Representers
    class OneReservation
      attr_reader :reservation

      def initialize(reservation)
        @reservation = reservation
      end

      def basic
        {
          id: reservation.id,
          status: reservation.status,
          tickets: tickets
        }
      end

      def extended
        {
          **basic,
          tickets: tickets
        }
      end
    end
  end
end
