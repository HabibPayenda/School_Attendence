# frozen_string_literal: true

module Api
  module V1
    class SchoolClassesController < ApplicationController
      def index
        result = SchoolClass.includes(:department, :teacher).all
        render json: { status: 'success', classes: result.as_json(include: {
            department: {},
            teacher: {}
        }) }
      end

      def create
        result = SchoolClass.new(classes_params)
        render json: { status: 'success', class: result } if result.save
      end

      def show
        result = SchoolClass.includes(:department, :teacher, :students).find(params[:id])
        render json: { status: 'success', single_class: result.as_json(include: {
            department: {},
            teacher: {},
            students: []
        }) } if result.present?
      end

      def update
        result = SchoolClass.find(params[:id]).update(classes_params)
        render json: { status: 'success', class: result } if result.save
      end

      def destroy
        result = SchoolClass.find(params[:id])
        render json: { status: 'success', class: result } if result.destroy
      end

      private

      def classes_params
        params.require(:school_class).permit(:name, :department_id, :room_number, :teacher_id)
      end
    end
  end
end
