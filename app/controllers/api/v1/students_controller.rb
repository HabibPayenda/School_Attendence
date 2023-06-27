# frozen_string_literal: true

module Api
  module V1
    class StudentsController < ApplicationController
      def index
        result = Student.all
        render json: { status: 'success', students: result }
      end

      def show
        result = Student.includes(:department, :school_class, :parent).find(params[:id])
        render json: { status: 'success',
                       student: result.as_json(include: { department: {}, school_class: {}, parent: {} }) }
      end

      def create
        result = Student.new(student_params)
        render json: { status: 'success', student: result } if result.save
      end

      def update
        student = Student.find(params[:id]).update(student_params)
        result = Student.includes(:department, :school_class, :parent).find(params[:id]) if student
        render json: { status: 'success',
                       student: result.as_json(include: { department: {}, school_class: {}, parent: {} }) }
      end

      def destroy
        result = Student.find(params[:id])
        render json: { status: 'success', student: result } if result.destroy
      end

      def show_attendance
        result = AttendenceRecord.where(student_id: params[:id]).all.order(created_at: :desc).limit(10)
        render json: { status: 'success', records: result }
      end

      private

      def student_params
        params.require(:student).permit(:name, :email, :password, :phone, :address, :grade, :date_of_birth,
                                        :school_class_id, :id)
      end
    end
  end
end
