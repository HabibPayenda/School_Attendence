# frozen_string_literal: true

module Api
  module V1
    class AdminsController < ApplicationController
      def create
        result = Admin.new(admin_params)
        render json: { status: 'success', admin: result } if result.save
      end

      private

      def admin_params
        params.require(:admin).permit(:name, :password, :email, :phone_number, :status)
      end
    end
  end
end
