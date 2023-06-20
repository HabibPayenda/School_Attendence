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
    end
  end
end
