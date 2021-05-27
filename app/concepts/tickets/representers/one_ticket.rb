module Tickets
  module Representers
    class OneTicket
      attr_reader :ticket

      def initialize(ticket)
        @ticket = ticket
      end

      def basic
        ticket.map do |ticket|
          {
            id: ticket.id,
            price: ticket.price,
            seat: ticket.seat,
            type: ticket.sort
          }
        end
      end
    end
  end
end