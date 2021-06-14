# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < ApplicationController
      def index
        @reservations = Reservations::Repository.new.find_all
        render json: Reservations::Representers::AllReservations.new(@reservations).basic
      end

      def show
        @reservation = Reservations::Repository.new.find(params[:id])
        render json: Reservations::Representers::OneReservation.new(@reservation).basic
      end

      def create_offline
        reservation = Reservations::UseCases::CreateOffline.new(params: offline_params).call

        render json: Reservations::Representers::OneReservation.new(reservation).extended, status: :created
      rescue Reservations::Repository::ReservationInvalidError => e
        render json: { error: e.message }.to_json, status: :unprocessable_entity
      rescue Tickets::UseCases::CreateWithReservation::SeatsNotAvailableError => e
        render json: { error: e.message }.to_json, status: :unprocessable_entity
      end

      def create_online
        reservation = Reservations::UseCases::CreateOnline.new(params: online_params).call

        render json: Reservations::Representers::OneReservation.new(reservation).extended, status: :created
      rescue Reservations::Repository::ReservationInvalidError => e
        render json: { error: e.message }.to_json, status: :unprocessable_entity
      rescue Tickets::UseCases::CreateWithReservation::SeatsNotAvailableError => e
        render json: { error: e.message }.to_json, status: :unprocessable_entity
      end

      def update
        @reservation = Reservations::UseCases::Update.new.call(id: params[:id], params: update_params)

        if @reservation.valid?
          render json: @reservation
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Reservations::UseCases::Destroy.new.call(id: params[:id])
      end

      private

      def update_params
        params.require(:reservation).permit(:status)
      end

      def offline_params
        params.require(:reservation).permit(
          :seance_id,
          tickets: %i[price sort seat]
        ).merge(
          {
            ticket_desk_id: params[:ticket_desk_id]
          }
        )
      end

      def online_params
        params.require(:reservation).permit(
          :user_id,
          :seance_id,
          tickets: %i[price sort seat]
        )
      end
    end
  end
end
