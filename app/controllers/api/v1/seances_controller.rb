# frozen_string_literal: true

module Api
  module V1
    class SeancesController < ApplicationController
      def index
        @seances = Seances::Repository.new.find_all
        render json: Seances::Representers::AllSeances.new(@seances).basic
      end

      def show
        @seance = Seances::Repository.new.find(params[:id])
        render json: Seances::Representers::OneSeance.new(@seance).basic
      end

      def create
        @seance = Seances::UseCases::Create.new.call(params: create_params)

        if @seance.valid?
          render json: @seance, status: :created
        else
          render json: @seance.errors, status: :unprocessable_entity
        end
      end

      def update
        @seance = Seances::UseCases::Update.new.call(id: params[:id], params: update_params)

        if @seance.valid?
          render json: @seance
        else
          render json: @seance.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Seances::UseCases::Destroy.new.call(id: params[:id])
      end

      private

      def update_params
        params.require(:seance).permit(:start_time)
      end

      def create_params
        params.require(:seance).permit(:start_time, :cinema_hall_id, :movie_id)
      end
    end
  end
end
