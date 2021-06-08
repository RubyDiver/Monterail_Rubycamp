# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      # GET api/v1/movies
      def index
        @movies = Movies::Repository.new.find_all

        render json: Movies::Representers::AllMovies.new(@movies).basic
      end

      def show
        @movie = Movies::Repository.new.find(params[:id])

        render json: Movies::Representers::OneMovie.new(@movie).basic
      end

      # POST  /api/v1/movies
      def create
        @movie = Movies::UseCases::Create.new.call(params: movie_params)

        if @movie.valid?
          render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # PUT  /api/v1/movies/:id
      def update
        @movie = Movies::UseCases::Update.new.call(id: params[:id], params: movie_params)

        if @movie.valid?
          render json: @movie
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      # DELETE  /api/v1/movies/:id
      def destroy
        Movies::UseCases::Destroy.new.call(id: params[:id])
      end

      private

      def movie_params
        params.require(:movie).permit(:name, :genre)
      end
    end
  end
end
