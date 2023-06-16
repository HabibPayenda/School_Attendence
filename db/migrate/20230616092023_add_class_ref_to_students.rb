# frozen_string_literal: true

class AddClassRefToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :school_class, null: false, foreign_key: true
  end
end
