class Api::V1::SeancesController < ApplicationController

  def index
    @seances = Seances::UseCases::Index.new.call
    render json: Seances::Representers::AllSeances.new(@seances).basic
  end

  def show
    @seance = Seances::Repository.new.find(params[:id])
    render json: Seances::Representers::OneSeance.new(@seance).basic
  end

  def create
    @cinema_hall = CinemaHalls::UseCases::Show.new.call(id: params[:cinema_hall_id])
    @seance = Seances::UseCases::Create.new.call(params: seance_params.merge(cinema_hall_id: params[:cinema_hall_id]))


    if @seance.valid?
      render json: @seance, status: :created
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def update
    @seance = Seances::UseCases::Update.new.call(id: params[:id],params: seance_params)

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

  def seance_params
    params.require(:seance).permit(:start_time)
  end
end