# frozen_string_literal: true

module Api
  module V1
    class ParentsController < ApplicationController
      def index
        result = Parent.all
        render json: { status: 'success', parents: result }
      end

      def create
        result = Parent.new(parent_params)
        render json: { status: 'success', parent: result } if result.save
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
