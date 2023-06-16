# frozen_string_literal: true

class AddDobToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :date_of_birth, :string
  end
end
