# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post 'login_admin', to: 'logins#admin_login'
      post 'login_teacher', to: 'logins#teacher_login'
      post 'login_student', to: 'logins#student_login'
      post 'login_parent', to: 'logins#parent_login'

      post 'admins', to: 'admins#create'

      get 'departments', to: 'departments#index'
      post 'departments', to: 'departments#create'
      get 'departments/:id', to: 'departments#show'
      delete 'departments/:id', to: 'departments#destroy'

      get 'classes', to: 'school_classes#index'
      post 'classes', to: 'school_classes#create'
      get 'classes/:id', to: 'school_classes#show'

      get 'classes/take_attendance/:id', to: 'school_classes#take_attendance'
      post 'classes/take_attendance/:id', to: 'school_classes#attendance'

      get 'teachers', to: 'teachers#index'
      post 'teachers', to: 'teachers#create'
      get 'teachers/:id', to: 'teachers#show'

      get 'students', to: 'students#index'
      post 'students', to: 'students#create'
      get 'students/:id', to: 'students#show'
      get 'student_attendance/:id', to: 'students#show_attendance'

      post 'parents', to: 'parents#create'
    end
  end
end
