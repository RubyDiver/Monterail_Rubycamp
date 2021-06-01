class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy, :update, :show]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def create
    @ticket_desk = TicketDesk.find(params[:ticket_desk_id])
    @seance = Seance.find(params[:seance_id])
    @reservation = @ticket_desk.seance.reservation.create(reservation_params)

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