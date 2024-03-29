# frozen_string_literal: true

class AddParentsRefToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :parent, null: false, foreign_key: true
  end
end
