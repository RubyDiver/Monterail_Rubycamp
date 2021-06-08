# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      # GET    /api/v1/cinema_halls
      def index
        @users = Users::Repository.new.find_all
        render json: Users::Representers::AllUsers.new(@users).basic
      end

      def show
        @user = Users::Repository.new.find(params[:id])
        render json: Users::Representers::OneUser.new(@user).basic
      end

      # POST   /api/v1/cinema_halls
      def create
        @user = Users::UseCases::Create.new.call(params: user_params)

        if @user.valid?
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PUT    /api/v1/cinema_hall/:id
      def update
        @user = Users::UseCases::Update.new.call(id: params[:id], params: user_params)

        if @user.valid?
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/cinema_hall/:id
      def destroy
        Users::UseCases::Delete.new.call(id: params[:id])
      end

      private

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :age, :email, :real_user)
      end
    end
  end
end
