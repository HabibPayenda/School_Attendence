# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_617_115_209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admins', force: :cascade do |t|
    t.string 'name'
    t.string 'password'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
    t.string 'phone_number'
  end

  create_table 'attendence_records', force: :cascade do |t|
    t.bigint 'attendence_id', null: false
    t.bigint 'student_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'status'
    t.index ['attendence_id'], name: 'index_attendence_records_on_attendence_id'
    t.index ['student_id'], name: 'index_attendence_records_on_student_id'
  end

  create_table 'attendences', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'department_teachers', force: :cascade do |t|
    t.bigint 'department_id', null: false
    t.bigint 'teacher_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['department_id'], name: 'index_department_teachers_on_department_id'
    t.index ['teacher_id'], name: 'index_department_teachers_on_teacher_id'
  end

  create_table 'departments', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'parents', force: :cascade do |t|
    t.string 'email'
    t.string 'phone'
    t.string 'password'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'scholl_class_attendences', force: :cascade do |t|
    t.bigint 'school_class_id', null: false
    t.bigint 'attendence_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['attendence_id'], name: 'index_scholl_class_attendences_on_attendence_id'
    t.index ['school_class_id'], name: 'index_scholl_class_attendences_on_school_class_id'
  end

  create_table 'school_classes', force: :cascade do |t|
    t.string 'name'
    t.integer 'room_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'department_id', null: false
    t.bigint 'teacher_id', null: false
    t.index ['department_id'], name: 'index_school_classes_on_department_id'
    t.index ['teacher_id'], name: 'index_school_classes_on_teacher_id'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.string 'address'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'school_class_id', null: false
    t.string 'date_of_birth'
    t.index ['school_class_id'], name: 'index_students_on_school_class_id'
  end

  create_table 'teachers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.string 'subject'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'attendence_records', 'attendences'
  add_foreign_key 'attendence_records', 'students'
  add_foreign_key 'department_teachers', 'departments'
  add_foreign_key 'department_teachers', 'teachers'
  add_foreign_key 'scholl_class_attendences', 'attendences'
  add_foreign_key 'scholl_class_attendences', 'school_classes'
  add_foreign_key 'school_classes', 'departments'
  add_foreign_key 'school_classes', 'teachers'
  add_foreign_key 'students', 'school_classes'
end
