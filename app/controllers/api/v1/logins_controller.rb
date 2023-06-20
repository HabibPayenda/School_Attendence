# frozen_string_literal: true

module Api
  module V1
    class LoginsController < ApplicationController
      def admin_login
        admin = Admin.where(name: params[:name], password: params[:password]).first
        if admin
          render json: { status: 'success', user: admin, user_type: 'admin' }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid name or password' }, status: :unauthorized
        end
      end

      def teacher_login
        teacher = Teacher.where(name: params[:name], password: params[:password]).first
        if teacher
          render json: { status: 'success', user: teacher, user_type: 'teacher' }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid name or password' }, status: :unauthorized
        end
      end

      def student_login
        student = Student.where(name: params[:name], password: params[:password]).first
        if student
          render json: { status: 'success', user: student, user_type: 'student' }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid name or password' }, status: :unauthorized
        end
      end

      def parent_login
        parent = Parent.where(name: params[:name], password: params[:password]).first
        if parent
          render json: { status: 'success', user: parent, user_type: 'parent' }, status: :ok
        else
          render json: { status: 'error', message: 'Invalid name or password' }, status: :unauthorized
        end
      end
    end
  end
end
