class Api::V1::CinemaHallsController < ApplicationController

  #GET    /api/v1/cinema_halls
  def index
    @cinema_halls = CinemaHalls::UseCases::Index.new.call
    render json: CinemaHalls::Representers::AllCinemaHalls.new(@cinema_halls).basic
  end

  def show
    @cinema_hall = CinemaHalls::UseCases::Find.new.call(id: params[:id])
    render json: CinemaHalls::Representers::OneCinemaHall.new(@cinema_hall).basic
  end

  #POST   /api/v1/cinema_hall
  def create
    @cinema_hall = CinemaHalls::UseCases::Create.new.call(params: cinema_hall_params)

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
    CinemaHalls::UseCases::Destroy.new.call(id: params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def cinema_hall_params
    params.require(:cinema_hall).permit(:hall_name, :volume)
  end
end
