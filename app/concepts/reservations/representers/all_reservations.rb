module Reservations
  module Representers
    class AllReservations
      attr_reader :reservations

      def initialize(reservations)
        @reservations= reservations
      end

      def basic
        reservations.map do |reservation|
          {
            id: reservation.id,
            status: reservation.status,
          }
        end
      end
    end
  end
end


