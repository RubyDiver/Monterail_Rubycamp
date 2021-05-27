module Tickets
  module Representers
    class AllTickets
      attr_reader :tickets

      def initialize(tickets)
        @tickets= tickets
      end

      def basic
        tickets.map do |tickets|
          {
            id: tickets.id,
            price: tickets.price,
            seat: tickets.seat,
            type: tickets.sort
          }
        end
      end
    end
  end
end