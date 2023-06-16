# frozen_string_literal: true

module Api
  module V1
    class DepartmentsController < ApplicationController
      def index
        result = Department.all
        render json: {status: 'success', departments: result}
      end

      def create
        result = Department.new(department_params)
        render json: { status: 'success', department: result } if result.save
      end

      def update
        result = Department.find(params[:id]).update(department_params)
        render json: { status: 'success', department: result } if result.save
      end

      def destroy
        result = Department.find(params[:id])
        render json: { status: 'success', department: result } if result.destroy
      end

      private

      def department_params
        params.require(:department).permit(:name, :teacher_id)
      end
    end
  end
end
