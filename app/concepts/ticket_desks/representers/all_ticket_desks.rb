# frozen_string_literal: true

module TicketDesks
  module Representers
    class AllTicketDesks
      attr_reader :ticket_desks

      def initialize(ticket_desks)
        @ticket_desks = ticket_desks
      end

      def basic
        ticket_desks.map do |ticket_desk|
          {
            id: ticket_desk.id,
            name: ticket_desk.name,
            online: ticket_desk.online
          }
        end
      end
    end
  end
end
