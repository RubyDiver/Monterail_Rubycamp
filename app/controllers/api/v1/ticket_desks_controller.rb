class Api::V1::TicketDesksController < ApplicationController
  before_action :set_ticket_desk, only: [:destroy, :update, :show]
  def index
    @ticket_desks = TicketDesk.all
    render json: @ticket_desks
  end

  def show
    render json: @ticket_desk
  end

  def create
    @ticket_desk = TicketDesk.new(ticket_desk_params)
    if @ticket_desk.save
      render json: @ticket_desk, status: :created
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end

  end

  def update
    if @ticket_desk.update(ticket_desk_params)
      render json: @ticket_desk
    else
      render json: @ticket_desk.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket_desk.destroy
  end

  private
  def set_ticket_desk
    @ticket_desk = TicketDesk.find(params[:id])
  end

  def ticket_desk_params
    params.require(:ticket_desk).permit(:name, :online)
  end
end