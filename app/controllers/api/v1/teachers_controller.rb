# frozen_string_literal: true

module Api
  module V1
    class TeachersController < ApplicationController
      def index
        result = Teacher.all
        render json: {status: 'success', teachers: result}
      end

      def create
        result = Teacher.new(teacher_params)
        render json: { status: 'success', teacher: result } if result.save
      end

      def update
        result = Teacher.find(params[:id]).update(teacher_params)
        render json: { status: 'success', teacher: result } if result.save
      end

      def destroy
        result = Teacher.find(params[:id])
        render json: { status: 'success', teacher: result } if result.destroy
      end

      private

      def teacher_params
        params.require(:teacher).permit(:name, :email, :phone, :subject, :password)
      end
    end
  end
end
