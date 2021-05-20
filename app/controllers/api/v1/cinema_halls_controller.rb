class Api::V1::CinemaHallsController < ApplicationController
  before_action :set_cinema_hall, only: [:update, :show, :destroy]

  #GET    /api/v1/cinema_hall
  def index
    @cinema_halls = CinemaHall.all

    render json: @cinema_halls
  end

  def show

  end

  #POST   /api/v1/cinema_hall
  def create
    @cinema_hall = todo_lists.build(cinema_hall_params)

    respond_to do |format|
      if @cinema_hall.save
        format.html {redirect_to @cinema_hall, notice: "Successfully created new cinema hall"}
        format.json {render :show, status: :created, location: @cinema_hall}
      else
        format.html {render :new}
        format.json {render json: @cinema_hall.errors, status: :unprocessable_entity}
      end
    end
  end

  # PUT    /api/v1/cinema_hall/:id
  def update
    if @cinema_hall.update(cinema_hall_params)
      flash[:success] = "Cinema hall has been updated"
      redirect_to @cinema_hall
    else
      flash.now[:danger] = "Cinema hall has not been updated"
      render :edit
    end
  end

  #DELETE /api/v1/cinema_hall/:id
  def destroy
    @cinema_hall.destroy
    redirect_to root_url, notice: 'Cinema hall has been deleted.'
  end

  private
  def set_cinema_hall
    @cinema_hall = CinemaHall.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cinema_hall_params
    params.require(:cinema_hall).permit(:hall-name, :volume)
  end
end
