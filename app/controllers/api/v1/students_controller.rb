# frozen_string_literal: true

module Api
  module V1
    class StudentsController < ApplicationController
      def index
        result = Student.all
        render json: { status: 'success', students: result }
      end

      def create
        result = Student.new(student_params)
        render json: { status: 'success', student: result } if result.save
      end

      def update
        result = Student.find(params[:id]).update(student_params)
        render json: { status: 'success', student: result } if result.save
      end

      def destroy
        result = Student.find(params[:id])
        render json: { status: 'success', student: result } if result.destroy
      end

      private

      def student_params
        params.require(:student).permit(:name, :email, :password, :phone, :address, :grade, :date_of_birth, :school_class_id)
      end
    end
  end
end

