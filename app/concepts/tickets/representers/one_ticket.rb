# frozen_string_literal: true

module Tickets
  module Representers
    class OneTicket
      attr_reader :ticket

      def initialize(ticket)
        @ticket = ticket
      end

      def basic
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
