# frozen_string_literal: true

class AddDepartmentRefToSchoolClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :school_classes, :department, null: false, foreign_key: true
  end
end
