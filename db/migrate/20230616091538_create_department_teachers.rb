class CreateDepartmentTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :department_teachers do |t|
      t.references :department, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
