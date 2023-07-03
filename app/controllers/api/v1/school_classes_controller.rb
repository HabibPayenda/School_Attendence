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
        school_class = SchoolClass.new(classes_params)
        if school_class.save
          result = SchoolClass.includes(:department, :teacher).find(school_class.id)
          render json: { status: 'success', single_class: result.as_json(include: {
                                                                           department: {},
                                                                           teacher: {}
                                                                         }) }
        else
          render json: { status: 'failed', message: 'Name has already been taken' }
        end
      end

      def show
        result = SchoolClass.includes(:department, :teacher, :students, :attendences,
                                      :attendence_records).find(params[:id])
        return unless result.present?

        render json: { status: 'success', single_class: result.as_json(include: {
                                                                         department: {},
                                                                         teacher: {},
                                                                         students: [],
                                                                         attendence_records: { include: :student },
                                                                         attendences: { include: { attendence_records: { include: :student } } }
                                                                       }) }
      end

      def take_attendance
        school_class = SchoolClass.includes(:students).find(params[:id])
        attendance = Attendence.new if school_class.present?

        school_class_attendance = SchollClassAttendence.new if attendance.save

        school_class_attendance.school_class_id = school_class.id
        school_class_attendance.attendence_id = attendance.id
        return unless school_class_attendance.save

        school_class.students.each do |student|
          attendance_record = AttendenceRecord.new
          attendance_record.attendence_id = attendance.id
          attendance_record.student_id = student.id
          attendance_record.status = 'pending'
          attendance_record.save
        end

        result = SchoolClass.includes(:department, :teacher, :students, :attendences).find(params[:id])

        render json: { status: 'success', single_class: result.as_json(include: {
                                                                         department: {},
                                                                         teacher: {},
                                                                         students: [],
                                                                         attendences: { include: { attendence_records: { include: :student } } }
                                                                       }) }
      end

      def update
        result = SchoolClass.find(params[:id]).update(classes_params)
        result = SchoolClass.includes(:department, :teacher, :students, :attendences).find(params[:id]) if result
        render json: { status: 'success', single_class: result.as_json(include: {
                                                                         department: {},
                                                                         teacher: {},
                                                                         students: [],
                                                                         attendences: { include: { attendence_records: { include: :student } } }
                                                                       }) }
      end

      def destroy
        result = SchoolClass.find(params[:id])
        render json: { status: 'success', single_class: result } if result.destroy
      end

      def attendance
        record = AttendenceRecord.includes(:student).find(params[:id])
        record.status = params[:status]
        return unless record.save

        result = SchoolClass.includes(:department, :teacher, :students, :attendences,
                                      :attendence_records).find(record.student.school_class_id)
        return unless result.present?

        render json: { status: 'success', single_class: result.as_json(include: {
                                                                         department: {},
                                                                         teacher: {},
                                                                         students: [],
                                                                         attendence_records: { include: :student },
                                                                         attendences: { include: { attendence_records: { include: :student } } }
                                                                       }) }
      end

      private

      def classes_params
        params.require(:school_class).permit(:name, :department_id, :room_number, :teacher_id, :student_id,
                                             :attendence_id, :status)
      end
    end
  end
end
