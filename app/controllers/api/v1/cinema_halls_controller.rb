# frozen_string_literal: true

module Api
  module V1
    class CinemaHallsController < ApplicationController
      # GET    /api/v1/cinema_halls
      def index
        @cinema_halls = CinemaHalls::Repository.new.find_all
        render json: CinemaHalls::Representers::AllCinemaHalls.new(@cinema_halls).basic
      end

      def show
        @cinema_hall = CinemaHalls::Repository.new.find(params[:id])
        render json: CinemaHalls::Representers::OneCinemaHall.new(@cinema_hall).basic
      end

      # POST   /api/v1/cinema_halls
      def create
        @cinema_hall = CinemaHalls::UseCases::Create.new.call(params: cinema_hall_params)

        if @cinema_hall.valid?
          render json: @cinema_hall, status: :created
        else
          render json: @cinema_hall.errors, status: :unprocessable_entity
        end
      end

      # PUT    /api/v1/cinema_hall/:id
      def update
        @cinema_hall = CinemaHalls::UseCases::Update.new.call(id: params[:id], params: cinema_hall_params)

        if @cinema_hall.valid?
          render json: @cinema_hall
        else
          render json: @cinema_hall.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cinema_hall/:id
      def destroy
        CinemaHalls::UseCases::Delete.new.call(id: params[:id])
      end

      private

      # Never trust parameters from the scary internet, only allow the white list through.
      def cinema_hall_params
        params.require(:cinema_hall).permit(:hall_name, :volume)
      end
    end
  end
end
