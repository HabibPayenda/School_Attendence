# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post 'admins', to: 'admins#create'

      get 'departments', to: 'departments#index'
      post 'departments', to: 'departments#create'

      get 'teachers', to: 'teachers#index'
      post 'teachers', to: 'teachers#create'

      get 'students', to: 'students#index'
      post 'students', to: 'students#create'
    end
  end
end
