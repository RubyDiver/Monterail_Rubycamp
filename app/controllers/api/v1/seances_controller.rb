class Api::V1::SeancesController < ApplicationController
  before_action :set_seance, only: [:destroy, :update, :show]

  def index
    @seances = Seance.all
    render json: @seances
  end

  def show
    render json: @seance
  end

  def create
    @cinema_hall = CinemaHall.find(params[:cinema_hall_id])
    @movie = Movie.find(params[:movie_id])
    @seance = @cinema_hall.seances.create(seance_params)
    @seance.movie_id = @movie.id

    if @seance.save
      render json: @seance, status: :created
    else
      render json: @senace.errors, status: :unprocessable_entity
    end
  end

  def update
    if @seance.update(seance_params)
      render json: @seance
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @seance.destroy
  end


  private
  def set_seance
    @seance = Seance.find(params[:id])
  end

  def seance_params
    params.require(:seance).permit(:start_time)
  end
end