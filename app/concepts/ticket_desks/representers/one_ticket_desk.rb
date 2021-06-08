# frozen_string_literal: true

module TicketDesks
  module Representers
    class OneTicketDesk
      attr_reader :ticket_desk

      def initialize(ticket_desk)
        @ticket_desk = ticket_desk
      end

      def basic
        {
          id: ticket_desk.id,
          name: ticket_desk.name,
          online: ticket_desk.online
        }
      end
    end
  end
end
