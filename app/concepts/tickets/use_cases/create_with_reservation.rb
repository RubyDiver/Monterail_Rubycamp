# frozen_string_literal: true

module Tickets
  module UseCases
    class CreateWithReservation
      SeatsNotAvailableError = Class.new(StandardError)

      attr_reader :reservation, :seance, :tickets_params

      def initialize(reservation:, seance:, tickets_params: [])
        @reservation = reservation
        @seance = seance
        @tickets_params = tickets_params
      end

      def call
        Ticket.transaction do

          raise SeatsNotAvailableError, "Can't create reservation without tickets" if tickets_params.empty?
          raise SeatsNotAvailableError, 'Every seats are taken' if available_seats.empty?
          raise SeatsNotAvailableError, 'Provided seat are not available' unless available?

          tickets_params.each do |params|
            reservation.tickets.create!(params)
          rescue ActiveRecord::RecordInvalid
            raise SeatsNotAvailableError, 'Provided parameters are invalid'
          end
        end
      end

      private

      def available?
        seats.all? do |seat|
          available_seats.include? seat
        end
      end

      def available_seats
        @available_seats ||= Seances::Repository.new.available_seats(seance)
      end

      def seats
        tickets_params.map { |ticket| ticket[:seat] }
      end
    end
  end
end
