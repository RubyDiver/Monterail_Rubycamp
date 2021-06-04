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
    @reservation = Reservations::UseCases::Create.new.call(params: create_params)

    if @reservation.valid?
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end

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

  def create_params
    params.require(:reservation).permit(:status, :seance_id, :ticket_desk_id, :user_id)
  end

  def update_params
    params.require(:reservation).permit(:status)
  end
end