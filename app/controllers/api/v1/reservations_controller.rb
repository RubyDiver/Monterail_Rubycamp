class Api::V1::ReservationsController < ApplicationController

  def index
    @reservations = Reservations::Repository.new.find_all
    render json: Reservations::Representers::AllReservations.new(@reservations).basic
  end

  def show
    @reservation = Reservations::Repository.new.find(params[:id])
    render json: Reservations::Representers::OneReservation.new(@reservation).basic
  end

  def create
    @ticket_desk = TicketDesks::Repository.new.find(params[:ticket_desk_id])
    #@user = Users::Repository.new.find(params[:user_id])
    #@seance = Seances::Repository.new.find(params[:seance_id])

    @reservation = Reservations::UseCases::Create.new.call(params: reservation_params.merge(user_id: params[:user_id]))
    @reservation = Reservations::UseCases::Create.new.call(params: reservation_params.merge(seance_id: params[:seance_id]))
    @reservation = Reservations::UseCases::Create.new.call(params: reservation_params.merge(ticket_desk_id: params[:ticket_desk_id]))

    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end

  end

  def update
    @reservation = Reservations::UseCases::Update.new.call(id: params[:id], params: reservation_params)

    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Reservations::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status)
  end
end