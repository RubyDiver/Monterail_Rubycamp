# frozen_string_literal: true

module Reservations
  module UseCases
    class CreateOffline
      attr_reader :repository, :params

      def initialize(params:, repository: Reservations::Repository.new)
        @repository = repository
        @params = params
      end

      def call
        Reservation.transaction do
          repository.create!(reservation_params).tap do |reservation|
            Tickets::UseCases::CreateWithReservation.new(
              tickets_params: params[:tickets],
              reservation: reservation,
              seance: seance
            ).call
          end
        end
      end

      private

      def reservation_params
        {
          ticket_desk_id: params[:ticket_desk_id],
          seance_id: params[:seance_id],
          user_id: offline_user.id,
          expires_at: expires_at,
          status: 'paid'
        }
      end

      def seance
        @seance ||= Seances::Repository.new.find(params[:seance_id])
      end

      def offline_user
        @offline_user ||= Users::Repository.new.offline_user
      end

      def expires_at
        seance.start_time - 30.minutes
      end
    end
  end
end
