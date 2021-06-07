class Api::V1::TicketsController < ApplicationController
  def index
    @tickets = Tickets::Repository.new.find_all
    render json: Tickets::Representers::AllTickets.new(@tickets).basic
  end

  def show
    @ticket = Tickets::Repository.new.find(params[:id])
    render json: Tickets::Representers::OneTicket.new(@ticket).build
  end

  def create
    @ticket = Tickets::UseCases::Create.new.call(params: create_params)

    if @ticket.valid?
      TicketMailer.with(ticket: @ticket).new_ticket_email.deliver_later
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Tickets::UseCases::Update.new.call(id: params[:id], params: update_params)

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

  def create_params
    params.require(:ticket).permit(:sort, :price, :seat, :reservation_id)
  end

  def update_params
    params.require(:ticket).permit(:sort, :price, :seat)
  end

  def mail
    TicketMailer.with(
      cinema_hall_id: params[:cinema_hall_id],
      movie_id: params[:movie_id],
    ).mail_after_success_buy.deliver_now!
  end
end
