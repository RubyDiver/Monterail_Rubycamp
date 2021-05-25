class Api::V1::MoviesController < ApplicationController
  before_action :set_movie, only: [:destroy, :update, :show]

  #GET api/v1/movies
  def index
    @movies = Movie.all

    render json: @movies
  end

  def show
    render json: @movie
  end

  # POST  /api/v1/movies
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end

  end

  # PUT  /api/v1/movies/:id
  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE  /api/v1/movies/:id
  def destroy
    @movie.destroy
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :genre)
  end
end