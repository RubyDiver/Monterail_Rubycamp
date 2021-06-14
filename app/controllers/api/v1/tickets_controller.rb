# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApplicationController
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
        params.require(:ticket).permit(:sort, :price, :seat, :reservation_id, :user_id)
      end

      def update_params
        params.require(:ticket).permit(:sort, :price, :seat)
      end
    end
  end
end
