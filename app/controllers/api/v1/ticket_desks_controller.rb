class Api::V1::TicketDesksController < ApplicationController

  def index
    @ticket_desks = TicketDesks::UseCases::Index.new.call
    render json: @ticket_desks
  end

  def show
    render json: @ticket_desk
  end

  def create
    @ticket_desk = TicketDesks::UseCases::Create.new.call(params: ticket_desk_params)

    if @ticket_desk.valid?
      render json: @ticket_desk, status: :created, location: @ticket_desk
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end

  end

  def update
    @ticket_desk = TicketDesks::UseCases::Update.new.call(id: params[:id], params: params)

    if @ticket_desk.valid?
      render json: @ticket_desk
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end
  end

  def destroy
    TicketDesks::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  def ticket_desk_params
    params.require(:ticket_desk).permit(:name, :online)
  end
end