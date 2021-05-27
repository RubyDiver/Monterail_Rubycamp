class Api::V1::TicketsController < ApplicationController
  def index
    @tickets = Tickets::UseCases::Index.new.call

    render json: Tickets::Representers::AllTickets.new(@tickets).basic
  end

  def show
    @ticket = Tickets::UseCases::Show.new.call(id: params[:id])

    render json: Tickets::Representers::OneTicket.new(@ticket).build
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @ticket = Reservation::Tickets::UseCases::Create.new.call(params: params)

    if @ticket.valid?
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Tickets::UseCases::Update.new.call(id: params[:id], params: params)

    if @ticket.valid?
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Tickets::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:type, :price, :seat)
  end
end
