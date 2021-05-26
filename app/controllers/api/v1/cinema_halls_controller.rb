class Api::V1::CinemaHallsController < ApplicationController
  before_action :set_cinema_hall, only: [:update, :show, :destroy]

  #GET    /api/v1/cinema_hall
  def index
    CinemaHalls::UseCases::Index.new.call
  end

  def show
    CinemaHalls::UseCases::Show.new.call(id: params[:id])
  end

  #POST   /api/v1/cinema_hall
  def create
    @cinema_hall = CinemaHall::UseCases::Create.new.call(params: cinema_hall_params)

    if @cinema_hall.valid?
      render json: @cinema_hall, status: create, location: @cinema_hall
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

  #DELETE /api/v1/cinema_hall/:id
  def destroy
    CinemaHall::UseCases::Destroy.new.call(params: cinema_hall_id)
  end

  private

  def set_cinema_hall
    @cinema_hall = CinemaHall.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cinema_hall_params
    params.require(:cinema_hall).permit(:hall_name, :volume)
  end
end
