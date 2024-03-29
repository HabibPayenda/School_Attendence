# frozen_string_literal: true

module Api
  module V1
    class TeachersController < ApplicationController
      def index
        result = Teacher.all
        render json: { status: 'success', teachers: result }
      end

      def show
        result = Teacher.includes(:school_classes).find(params[:id])
        render json: { status: 'success', teacher: result.as_json(include: {
                                                                    school_classes: { include: { teacher: {}, department: {} } }
                                                                  }) }
      end

      def create
        result = Teacher.new(teacher_params)
        render json: { status: 'success', teacher: result } if result.save
      end

      def update
        result = Teacher.find(params[:id]).update(teacher_params)
        result = Teacher.find(params[:id]) if result
        render json: { status: 'success', teacher: result }
      end

      def destroy
        result = Teacher.find(params[:id])
        render json: { status: 'success', teacher: result } if result.destroy
      end

      private

      def teacher_params
        puts params
        params.require(:teacher).permit(:name, :email, :phone, :subject, :password)
      end
    end
  end
end
