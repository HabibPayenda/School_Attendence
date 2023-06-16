# frozen_string_literal: true

module Api
  module V1
    class SchoolClassesController < ApplicationController
      def index
        result = SchoolClass.all
        render json: {status: 'success', classes: result}
      end

      def create
        result = SchoolClass.new(classes_params)
        render json: { status: 'success', class: result } if result.save
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
        params.require(:school_class).permit(:name, :teacher_id, :room_number)
      end
    end
  end
end
