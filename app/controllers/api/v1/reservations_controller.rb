class Api1::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy, :update, :show]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def create
    @seance = Seance.find(params[:seance_id])
    @reservation = @seance.reservations.create(reservation_params)
    @reservation.ticket_desk_id = params[:ticket_desk_id]
    @reservation = (@seance.date.to_time - 0.5.hours).to_datetime

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end

  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end