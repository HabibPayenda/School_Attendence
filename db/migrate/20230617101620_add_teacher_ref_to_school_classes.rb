# frozen_string_literal: true

class AddTeacherRefToSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    add_reference :school_classes, :teacher, null: false, foreign_key: true
  end
end
