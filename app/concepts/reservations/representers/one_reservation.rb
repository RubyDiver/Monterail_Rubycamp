module Reservations
  module Representers
    class OneReservation
      attr_reader :reservation

      def initialize(reservation)
        @reservation= reservation
      end

      def basic
        {
          id: reservation.id,
          status: reservation.status,
        }
      end
    end
  end
end
