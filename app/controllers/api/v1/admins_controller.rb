# frozen_string_literal: true

module Api
  module V1
    class AdminsController < ApplicationController
      def index
        result = Admin.all
        render json: { status: 'success', admins: result }
      end

      def create
        result = Admin.new(admin_params)
        render json: { status: 'success', admin: result } if result.save
      end

      def update
        result = Admin.find(params[:id]).update(admin_params)
        render json: { status: 'success', admin: result } if result.save
      end

      def destroy
        result = Admin.find(params[:id])
        render json: { status: 'success', admin: result } if result.destroy
      end

      private

      def admin_params
        params.require(:admin).permit(:name, :password, :email, :phone_number, :status)
      end
    end
  end
end
