# frozen_string_literal: true

module Api
  module V1
    class ParentsController < ApplicationController
      def index
        result = Parent.all
        render json: { status: 'success', parents: result }
      end

      def create
        parent = Parent.new(parent_params)
        result = Student.includes(:department, :school_class, :parent).find(params[:student_id]) if parent.save
        return unless result.present?

        render json: { status: 'success',
                       student: result.as_json(include: { department: {}, school_class: {},
                                                          parent: {} }) }
      end

      def update
        result = Parent.find(params[:id]).update(parent_params)
        render json: { status: 'success', parent: result } if result.save
      end

      def destroy
        result = Parent.find(params[:id])
        render json: { status: 'success', parent: result } if result.destroy
      end

      private

      def parent_params
        params.require(:parent).permit(:student_id, :email, :password, :phone, :name)
      end
    end
  end
end
