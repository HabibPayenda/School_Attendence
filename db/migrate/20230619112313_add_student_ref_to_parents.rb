class AddStudentRefToParents < ActiveRecord::Migration[7.0]
  def change
    add_reference :parents, :student, null: false, foreign_key: true
  end
end
