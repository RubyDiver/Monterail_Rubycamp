class Api::V1::TicketsController < ApplicationController
  before_action :set_ticket, only: [:destroy, :update, :show]

  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  def show
    render json: @ticket
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @ticket = @reservation.tickets.create(ticket_params)
    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:type, :price, :seat)
  end
end
